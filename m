Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCh8-0002np-Kl
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh1-0002kT-HJ; Sat, 23 Oct 2021 04:47:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:3769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgw-00074P-0g; Sat, 23 Oct 2021 04:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978869; x=1666514869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NGwNLy3VtsuvzQvknfNkvFHGtfZZZZlsEz+En4k0Ids=;
 b=be74hvjgGGPnzo0GAOJRaLAVdyDWroJ4NRFxvYL0blB94IF0eTC+zb+P
 BtViOuYSyuFHcrgoHWBLGQmeCqXeE7ZSAIyYRoTxEOO6Ti20n85KllRzV
 twCSXOxpFszDWu0AZtDNPq5gtC6ghFgBjaFxkbNPTpIJDQ71gO3uh7wAW
 VoI+FDp47le7KUOtRLf4rLonF8pgXtAJL3yz/Azt+BEJR7CszeAF+3WXv
 17m99esXsfuvRx2toIrBo0yNvdTAvfgnADxlI9EpfmMNzr67P8rRiXzAd
 sxpTnV3CbjwkQhFKgXS/5cgudIYMmX1LaQrW4EW98kjniqfVoLC435nDr Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="287539676"
Received: from mail-dm6nam08lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxOmK7nSgeRmJh5rkfPsKd1ZVZOJbcTjaSHhFrZAI6KALlpbjk2eSqlLAg1dWCz4hAswDQa3FTzvG0nkg3PqbuEpG+l9f5lIAE1gFdz863MZC1oY2YYsGP4NUHBINevYeIYljp6MwYZhDlSkkFZ027tUm/XKva0IeTiWsIZK9nHdu7/3lyHgMX/b9BKUf9tBp31KWxGcimdN+MaeYzGcqvKhebnTRKNuFpyakHFmnFyEca7EVKOL67g807N4t+p+RelJjkqtZbUeRdv4okrnOIEOiI2Z9vhXzIHfMEcZ2cuLVisbYSeLIQMeD78kp7KN0hpmx0VA7sKsX7gnUdq+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IoA+eQN/FbuJHLOtN90iE/uH/FjhhGxlNydRO6Cqc4=;
 b=GsydG9/1U6aKyIwVw7z9p493nvK2HDio5wG4/r5n2lkwz4p1WmdwKWGp6JnkKSUff/6Z7z30hY0GYrOg8maFL0F1x5BBiTBM1srgzc8238OtlB6o1tJG/7hb7H1mY4PXRwJ9PKdHbVZni1cEmAZKmxhwZyksnTAsqevuWuPDm2r6EDjQHmRqAxOMepxvqnZuiHC6WIHRU5flg26Ay1L2N5ydbY6t/PMPG2+aFoGgsp+fXqpYTnjHox25emiNBBKF6BXDKFIVRbxkQWTenkIuoe6lSxcp/1pyOBxT4vz3MlwV78zsSYVZ6wmbtCqfueVe/7Uh5DA3DKHb8h6PUhUg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IoA+eQN/FbuJHLOtN90iE/uH/FjhhGxlNydRO6Cqc4=;
 b=Zhz0Mf8jSbu62fEg2YL+tv+TkSR9HlXwFxDM2YJQcTnioCIV8eWJzrNW+7DmeoK822Fqc0OfKSZp7MCX9vhj9lb3ReRYFmAHPYGuQp6m5fjhD6iVuQxx2Cr4vsrteicxxENRg7A8N2lKyF6aADG9t67gTSYRf6DuLIiJ5y8fAzo=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7793.namprd04.prod.outlook.com (2603:10b6:303:13c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:47:46 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:46 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 08/22] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Sat, 23 Oct 2021 14:16:24 +0530
Message-Id: <20211023084638.1697057-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bf698c5-7398-4a10-8613-08d99601c91a
X-MS-TrafficTypeDiagnostic: CO6PR04MB7793:
X-Microsoft-Antispam-PRVS: <CO6PR04MB779394EF562FC2918CEB66678D819@CO6PR04MB7793.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSoDo4e9KX9TG1ND4HzUcE+Jos5YXf4qhy8oGgPxc5OCRCbKph+KzmdfpuTy5ceDYjYOSRXJ+DhibOPp30pSAPye+ziAEjQEWm30r9/jNSoYu7qIrvEYd+rhBYcwAP9bQ08GKuYoZLqbUQTkWcIPHdlhsqhoJhMYPdjiwF5XnA/E+3QJxSYHu+mE3Zoc5cRns3Gaej0vIYWg9iesNN5pM9BTY77Qw9i3kNiidNz5y0lIFSqk+IhXXfWi8E7i5aoNy3jGEgTeWQ1ltttjDCiWKGSXdFcDNUwiv31GOlTQFF3jumZ5zO7/0Vx86GSNDJEJB6IETp1d4YWyP3dcEgG/cf5nTMDml9pCIvXbLXQlWkZmqSHv91eydUoaayQnmarcK2BTRjoHS1CRFkYeU/JbjND+ecR1gzJKoHLgm7n5+H5B4AjPNA/HLeVn4JHi3HnXIOrlupSV0C2SRtRZcPPKjUetzrJO07rOx/+TSQZBEEL1vpxqB5CBMkr9kK39g8GSKxhw0d9MrEzGWE2PPQfnPqb5XbWn1d3BLZ/kfG9gqCQyVVWimU1KqDWevlw34JLP+CSQ/EwSwb8r9f+kJ+tLmBkHD/I5MnBmCo7AXYLy6yjOIN1WlZAPhqtZdihdhnFxQYKesQKpYbVasPBszAuB8Ub7s9L36vppqxU6N8QICiZFX3ZV7CWEIUrqlG4rgG/9q1l7bzygHVHJXTPEHh5HeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(82960400001)(66476007)(66946007)(52116002)(186003)(956004)(83380400001)(316002)(6666004)(38350700002)(38100700002)(2616005)(86362001)(4326008)(36756003)(54906003)(508600001)(2906002)(26005)(44832011)(7696005)(55016002)(110136005)(8886007)(8936002)(5660300002)(8676002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GaLv+AWdsiQIQ4Oi/xP0Fg4OnZl6ZWSm4G0ND0ehGUuknvkR2qNRJOe7TV+A?=
 =?us-ascii?Q?kNgS9gmVt0dowMGqB4ry4h+Fo8N6LRf24Caj8plLrPGFmGaF2kOmVkR/5bLF?=
 =?us-ascii?Q?zWddO+4e8HNcSKYPMRucNlCd/FLw69FtKwv4xm/UlcHPRLPejVnXsZA5EgET?=
 =?us-ascii?Q?M6fyBMbXjOXBMP4hsPGNQxp2j9/amA5hZ7d0KzCW3cBwPrPeZAgRcPMxX86h?=
 =?us-ascii?Q?pJwUqOjvhNBxnu28UXgLl1JWWIHk0v3Tow0aSwpy7dsAzeyEZokHH9fCQqod?=
 =?us-ascii?Q?z3FDpwByQOhVV4o51XpAEBkhJ/NRnzFvM3L+ok9GRGeLg+w20KTas8ObK9xX?=
 =?us-ascii?Q?Ej+KB69+2m5X7CIeCS9t0WJDo49Bm1DjeHKR59bmPHYN3zas4Y6PbRtvJ6xB?=
 =?us-ascii?Q?O3c6Q8fYesuAfFx7IqRtLSI05jRpa3Tn+pKtVIXFT3gJluSnh2N+cj9qkst3?=
 =?us-ascii?Q?7DDfWVosoTwt18pmiMNK1kfy+O93jjqZImASYAB1chuPumyKZ718+UILiwNa?=
 =?us-ascii?Q?F4pctu2dF6+mt5GUn0a6TrXddjy4R/gp59LNznYAphcGld8+lg4Em4Mj860N?=
 =?us-ascii?Q?DQHsGEurh/QGrDYUwtfQZR6pN9qaN3W+HMJsSOxQ4m2YZKynmhMtfXUAiIxZ?=
 =?us-ascii?Q?aVZYQQewVlwvHRpjp4KaLJ06c8yd5s0OIVsnTJy+yRFK2DYlVZppP6Uggmam?=
 =?us-ascii?Q?l080+IlNIDcm3AANKDXuB6chSUUfSymzpAee/HHU7H7YnBlYU6Rnn8uNambk?=
 =?us-ascii?Q?Ehx0lw/mIvUeZMQeclgTPU0Nf503NAUpoNUcPve/T8tX7N9FgfsF1S7VI8au?=
 =?us-ascii?Q?RlAZRAMTU9lc7QInzSkeIDjyyusNon2PbNX5kvl0+pJLAUckdd+ZJaXgHDvU?=
 =?us-ascii?Q?pi4Um/yd61zdQKtXedcmpb5rEQGUgmdOM81BMFfle3UA4duUlUEOe/E/v5Ab?=
 =?us-ascii?Q?Vn3qE8ajVZHksa/W9y9E0kEnudl0S7QmkFu901UtDFPs1Y8jzDhao5YZIyse?=
 =?us-ascii?Q?pOyiRi65T3TGU7oNI8Cl5Oyvssoz1BUmD4SC+tLqXMPfCy/n6oVgoHjNwek7?=
 =?us-ascii?Q?vHmKM2So3VuYBvNJR0WjpUmzMmvjF25K2L2BiIDlF+FN0l0nkCPsat/w/EtE?=
 =?us-ascii?Q?DdjVLYRgCeQQxXX5fMB+9PzhT+O7wwBYhc/icnp9oO2HABvv5iCPtPMQvMOa?=
 =?us-ascii?Q?rUfil0aTeBUqh7ecWI57wyuJ0EjCDaIknAWr4JJ+XlxHgC84xdzdC/jnYZxJ?=
 =?us-ascii?Q?65YD9gpA7WCRkqVZbTSdm4eZdGB7OnlzOZ/N9+YoTJWIEBrWvx9CEvWPHwyl?=
 =?us-ascii?Q?/nQ7MfSxnqznSF3k8unTkfEBwhlww2XwUFWQ9ch80qPileI2Z4AmUnI5Vs8g?=
 =?us-ascii?Q?CI6jhy5p6IkM0pRJOlMKLtTzHDN1cQyYEZAWW+koTQZY5htjYfHcAnmvba58?=
 =?us-ascii?Q?YYeylQcZp7poOOG9Ngzm5fCNI4J8xQ2k+20lLiVRx2VVOwamkjj0XHbWptZY?=
 =?us-ascii?Q?e7mo9LqOgcMiJeNrLSj+r0oprb82oPcgYnV6iNXV53V+yGJ/6Sm4NkdqLz0s?=
 =?us-ascii?Q?EdgiFW1iCHo19mQ0TPXH+sYTuzwTyQxhUJYyaBiDpcW3XAtwwmaRngJf6kbg?=
 =?us-ascii?Q?JLpKqEY1GdXF4oHclzP1++s=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf698c5-7398-4a10-8613-08d99601c91a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:46.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URgG0OG0GznEzCc7cmuTHaH5OBNvthF4cy37VUS4x1OObLw90p408W/Fi7rwMiczX7g10VyCRiOgUGfK/RNnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7793
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Oct 2021 08:47:57 -0000

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h        | 19 +++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7182fadd21..ef4298dc69 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -239,6 +239,18 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein) \
+    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
+     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 20) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 24) & 0x3f)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 #endif
@@ -380,6 +392,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 04df3792a8..d70def1da8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -375,6 +375,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
     env->rdtime_fn_arg = arg;
 }
 
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_fn[priv] = rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
-- 
2.25.1


