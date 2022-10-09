Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohVyk-0006mv-3O
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 09:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@outlook.com>)
 id 1ohR9X-00009c-55; Sun, 09 Oct 2022 03:55:15 -0400
Received: from mail-dm6nam12olkn2081c.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::81c]:35809
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@outlook.com>)
 id 1ohR9V-0008CH-Ct; Sun, 09 Oct 2022 03:55:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AF47MAMUNjN9S2JS9gqluhjZSP+H/WzL5lc/0ooB6x1buXSXqYLafQzaU5WSnn6bmqT1idDopFZPJVm3PqR5GE/FnGVrvgfUW7ILkN4z4iJqOB5vNyeXled/iV7pDB5hEMii4uyMCqksXRd+uTgg2Syjfkz1geZbfVjlEsm+2pjuY8p7HopyV0UTWuKE80iT1VI1gtxFyCAVf4kSm13jRqhRorJu3C54Uqhva8zQhfE7STleWLIyW1thkJmGmvS0/Pq9layodWWuaoZvSGmirk7V5jiKKtcXFY3qrk7wq6VAB92AeoZiyTrcurc4A0mGC56xqPD3kQvAzuxzybv0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVMblW1v1bcbyP/SeoN/pl9YgGpmlj7T/W6DC/lWnUY=;
 b=T0D1Gu+wsCy2PEx0wwf3lU/NDS1McbRpUa4qu+vhjrRWZsFrJTy0qYQHUlCaXmVGjlO6YIJP/HY4XIJ+vYHoHAvM7dgVTizvye4YHbniVQVmJ2B5Vw5M8CR0N0ymm2zO+o4P54jtrUpuX+t3EBl3VTOpz2s8p0RfU5xUGamDTHubyH4ghDrPi1GGcDUWcdu98/iHyPbB5SHOd3WNahsyuv0zIZ/pGGvb6JPq7S7f7igFHFYl1u2daEgOZo+Ujjq5D4PsszsP4+0VFmJ4l/6FJbbnel3b8VboXduRmcTr/J/q3A5TWUStfXjDnEMbNHraFrKvl/3NUbRdyjcnXooNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVMblW1v1bcbyP/SeoN/pl9YgGpmlj7T/W6DC/lWnUY=;
 b=WeIuqAbb7fugG2uRl3bsdmtfHyM3s/IEg/qvBX3o/oaBvBg4jEqoeLNpLe+Rcsnm5DScZABJ+sZVTukwYMa/unPnmNbvgFBslq8VWWHqNFiEoQmyZXTb4dcIwhEkeekiV6g4F02BT10UfBUS6cyjQgfxoHPPndW4b6xuFBuv/yKjSdZhrB4Ir6UBNq5Lle2gkQQqgVUCftmAcbrGinVM4PxezqFKcsR3h5UMCd54qd0qHzM8XWJa/bvaGaPb9uXQ+6UZC2icIOq4RC1lfREl3Z3+YP3KGLFhL+H1J7NCUX1tljZeFgHt7uVdQZCS/RtxqXKqPsYHUkDQGKGAgSNkeA==
Received: from BN7PR08MB4355.namprd08.prod.outlook.com (2603:10b6:406:f3::18)
 by DM6PR08MB6394.namprd08.prod.outlook.com (2603:10b6:5:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 07:50:05 +0000
Received: from BN7PR08MB4355.namprd08.prod.outlook.com
 ([fe80::3641:8855:3a78:cd1e]) by BN7PR08MB4355.namprd08.prod.outlook.com
 ([fe80::3641:8855:3a78:cd1e%2]) with mapi id 15.20.5676.028; Sun, 9 Oct 2022
 07:50:05 +0000
From: Bin Meng <bmeng@outlook.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH] hw/riscv: Update comment for qtest check in
 riscv_find_firmware()
Date: Sun,  9 Oct 2022 15:49:47 +0800
Message-ID: <BN7PR08MB435525C92550BAC5467BE672BF219@BN7PR08MB4355.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [PeuzRRydFIY5UVrCmRAngtL5j4wOu1BU]
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To BN7PR08MB4355.namprd08.prod.outlook.com
 (2603:10b6:406:f3::18)
X-Microsoft-Original-Message-ID: <20221009074947.3355776-1-bmeng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB4355:EE_|DM6PR08MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 6758fc3a-40aa-4eac-44cd-08daa9cae0d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXjcmAMt8DE9r62F9c62PSKWaer03T+ifSkR0NR2+gKGAWQgL2OjK9NukwvbArCMMBgxw5UZNs4kqihTuGmuQ5fIWrN0NayNNejBB05Owi4gk6nEG5HupQ83Uzu7xhZd8mzZ/xQx+nBRtDkey0B4bQ9hk+ZMnHvHsN22TNt7Kjfl4DtaPF+jangKPi0ZCw3UBj0QOUxNPS3uDZVSUdM0qOklV44V+i5kLhmZsSPKnp4E+G8/YnmQjqERu5X2cHvF4xUXfGPCn9BuCEtqqYlHnNBE9976oH+RjQnE2VwiKTAv+UeacZrnwbpmReZ4c6NT/SV0xm0awtF4fh+3e4ZnV0Kdxkk5cDY8+rXj3Q3ExPzcX+lM+/Dx5TzXSq2dYo/SiDRGbD5EjoDeyJiBmpt48PPqEuxH7+HjLDwxc+KWQk7f9AL8+Wz3Iwu/8Zyok2fQC5aF7SiCbfYk1UcbmMlEB31I5MnFcbxnBITNZrnwTJ52i+pGKTmR1wAazWNTd+aQbWmdkDtvBSQw4z1px0JbJjlUZBC4/RTxbQj6QhG6WMi8SG9d9rN1sdrNNKjuytxVqZhh3Azj7BBlzPuqSZRFnkPiGrDomDZpvgpR085uf0YAOoRfjP4aNHNJAJFzu4FqODNIuYdWI09GLXJ9i/g4DQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xi7kemqXjWRftMBRBVHySslo9E8v59iScyGQFhg8YsymWpmuMFaUDBh2TScX?=
 =?us-ascii?Q?YwrMo//xCuLx0Mx7Tr/pkyGkh96oZAUQ+aHTYf9DkM4DSl+/Lwk0BhjlNfm9?=
 =?us-ascii?Q?pgzmFk2BQ2yPFo+NqocE+TecreNVFNHgyasns5RU12A2wiOyFY8myVsbMIyZ?=
 =?us-ascii?Q?WjflJQAs8OYdnkr1w+BoyiK+c25vUj2KXMVLvEWEStyYKpxbI6YUIhmNyMlY?=
 =?us-ascii?Q?XnlNCtm3AkKUyHhM1a6v3ey7EcrkZEkvyVQjRolxGRJ+hRrgaWa5gUmFFTZ+?=
 =?us-ascii?Q?XcwMk5K1lTCaCo8EPu8VKiV2OkbZqA4fiStUd3LOYCHVkaHPw4sg4SRAcZ6b?=
 =?us-ascii?Q?ddlyUdb8WbN31RyHydhrnvVHDCRcJrFeNsKZ91JakOTYmMuPeyvd9w9JYFaB?=
 =?us-ascii?Q?WIMQBLoHzgOMevVqfgr17l57xTCX4Q4GovyKB2EjVGcMLaytQj3rfKRAxR8A?=
 =?us-ascii?Q?bVCHIl9MJRve8nrRrALN0oOAJoPg5IwxOrgMUTjbHsmxVBc04mYwi6N3d5g9?=
 =?us-ascii?Q?SMWLm1l3sYvegdQU37V+w9y3MknP1dKayKnCdUnl+PW5X3BrzZWomZWQQUvK?=
 =?us-ascii?Q?MQ1PSJ8g7cP+pF59xHLQAfrsYU562kSzaNHpV/bab6km0MMugmRO7Ezyq3rf?=
 =?us-ascii?Q?ycxgdMejELOIWgfxGRGMFheZBUft81Hh15e+/HREyTnIHp2g8z1n+Hg6gcTU?=
 =?us-ascii?Q?+rjKQ5p9oognKQJRPu2i0eSqUzObRHvlgjnAjaNklqishimGb1Gy4zTArWVr?=
 =?us-ascii?Q?r8GRc2XCO77tzynTfUzfZhVubnQxpJd92nS2TaWJMJzg0tdgCf0d/UJs3Y0m?=
 =?us-ascii?Q?pD1QX/BY651B3MZhg0WxW8mcjrl+mnfK07Tf4+xUcEx1HpsbFPI020lJ/gUU?=
 =?us-ascii?Q?X8IP1hIoeZJXoZDdkDWvsTmQH/elhKiVI4FRamjzy3KBUBeQ7HHxFYN+NdIx?=
 =?us-ascii?Q?NEZVndv+hF4qTl0fyyqucTJpVwYldbaknwxNUbzwwaln3w7yg33WMtjT7vEN?=
 =?us-ascii?Q?XOPys4IgHKYuooACT/YiwI/cDZTxjf52rthgXLlYFh1WofLTu/Wtgheqb3Zz?=
 =?us-ascii?Q?fvrgrYIMQKj6Eaij7NJ/A24qSQ/Dv0kL6P6GiGYuaW856up4g/UqpEI07Ed3?=
 =?us-ascii?Q?WYa5zGaUkdcf9ZCk85W8pPntNo8VtUmiPQqEAyk8wvPFZgCaOsRfqy3OzXVY?=
 =?us-ascii?Q?nT8krFfrWrjwTX2ZFrvOLV/cpcm9WQ4jfxlAgb0/GJlUF9MaPsnBZNrDtnKG?=
 =?us-ascii?Q?k1O6IkuBu+ymnyAKmmFwmxFfK5W2xWK9o/Tq3NQdVw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6758fc3a-40aa-4eac-44cd-08daa9cae0d8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB4355.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 07:50:05.6166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6394
Received-SPF: pass client-ip=2a01:111:f400:fe59::81c;
 envelope-from=bmeng@outlook.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Oct 2022 09:04:25 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Oct 2022 07:55:15 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Since commit 4211fc553234 ("roms/opensbi: Remove ELF images"), the
comment for qtest check in riscv_find_firmware() is out of date.
Update it to reflect the latest status.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..f6e8eafa28 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -111,8 +111,8 @@ char *riscv_find_firmware(const char *firmware_filename)
     if (filename == NULL) {
         if (!qtest_enabled()) {
             /*
-             * We only ship plain binary bios images in the QEMU source.
-             * With Spike machine that uses ELF images as the default bios,
+             * We only ship OpenSBI binary bios images in the QEMU source.
+             * For machines that use images other than the default bios,
              * running QEMU test will complain hence let's suppress the error
              * report for QEMU testing.
              */
-- 
2.25.1


