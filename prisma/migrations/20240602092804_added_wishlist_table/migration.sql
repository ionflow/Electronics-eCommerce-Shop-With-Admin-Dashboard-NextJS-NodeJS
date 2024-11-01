-- First create the table
CREATE TABLE IF NOT EXISTS `Wishlist` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;



-- DropForeignKey
ALTER TABLE `wishlist` DROP FOREIGN KEY `Wishlist_productId_fkey`;

-- Then drop any existing foreign key constraints
ALTER TABLE `Wishlist` DROP FOREIGN KEY IF EXISTS `Wishlist_productId_fkey`;
ALTER TABLE `Wishlist` DROP FOREIGN KEY IF EXISTS `Wishlist_userId_fkey`;

-- Finally add the foreign key constraints with CASCADE behavior
ALTER TABLE `Wishlist` ADD CONSTRAINT `Wishlist_productId_fkey` 
    FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
    
ALTER TABLE `Wishlist` ADD CONSTRAINT `Wishlist_userId_fkey` 
    FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
