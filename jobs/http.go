package jobs

import (
	"github.com/bolsunovskyi/scheduler/plugins"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
)

func InitHTTP(r *gin.RouterGroup, db *gorm.DB, loadedPlugins []plugins.Item) {
	r.GET("/jobs", makeListHandler(db))
	r.GET("/jobs/plugins/schema/:name", makePluginSchemaHandler(loadedPlugins))
	r.GET("/jobs/create", makeCreateGetHandler(loadedPlugins))
	r.POST("/jobs/create", makeCreatePostHandler(db))
	r.GET("/jobs/edit/:id", makeEditGetHandler(db, loadedPlugins))
	r.GET("/jobs/status/:id", makeStatusGetHandler(db))
}
