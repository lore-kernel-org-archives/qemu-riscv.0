Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBI-0003K7-Cu
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBC-0003Ew-GO; Tue, 26 Oct 2021 02:43:28 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB9-0000sH-2x; Tue, 26 Oct 2021 02:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230602; x=1666766602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NGwNLy3VtsuvzQvknfNkvFHGtfZZZZlsEz+En4k0Ids=;
 b=gBz5BaFx7tLi4cyl6z+Jew/2ytpa3kSPD4/0ikYplaPvN7hv52TUYx30
 Vh59A4mGXCp68S8oA8x1uZjlYGTeqxGOHJiUb7HC3ghfPyug4FZjOM/Fz
 Z5HLbHyyct8dJuyO81Ny1sauaEtOSqZ86vtEc0NmEF7Wv0FQWr/RCyNqP
 +rL9pc2INSQq7sv3oqNakFtAxJbfy1TWlcC+pv4xl5I1OCC1TADBE0iLP
 PHmqLX3T7ACriyNayA6bNj7RzOOXBnEgbihR7F7EFMAYmXQsxp3cudmYC
 et7uLy7x914W9A4EO+xytWTpcMQAxzS15R8hbWsekAB4gq0+D/Z28Rg3B A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854757"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la9cOHenet+UNKRlo6ViCFnCcFcrTNnmrjqTt/2oPC92aA+Qca3VBjwgy53rWhOaseeaXfoKZh74GR8e62sdl9RmKoZeWmeFRQ5Z+ugBMnj47jDhNUspvgiHPqSvIx9Eg+wlz9ckkUxCbqr7KlikUKakNsMROiuFVria7wa/Bh64gZrD0CFRBFt7tKTs58+aiDIai0NKmm1bRXVMpF9VpdVnqlUZIvmKz/9gyPCnrkm+dl/VTgUeCRAdUE7iJ4GTJghS3KYHK/KJ9w06cl7puxdD2x8fDrEuAyRFqO3J6p0A7At1CTRLoFlWqLU1hAYtIJr4ooaaFbvJvSKbgbm3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IoA+eQN/FbuJHLOtN90iE/uH/FjhhGxlNydRO6Cqc4=;
 b=df8sBRgutHK2rUb4Hzg5mpRXtElRrmr9O94OuGx3LMXD6M+hcohiM8vjFc4eIqu8P4tWDJ2Lu1Id/u6WIS3lgDVgVTlYLZ09X1ADwQrFKY9gsw/iyI7QS5bLxoNu4zIRMCG4c71aCEfmiZHXEUVVSFcYdkSLvC7nn6I7yQp3Xt4gekuShMHWg2P1vax/yxUI4O8HHvf6LfWXGyxFBSa09u20x//vZ+USCGm+PJ6O+WCVKNLFQ06aK8IL7PNqyekNfW6Vz/onYoprabHqK4/HN2oPPYN4Q8mgU35bu+T/uNVJv9KIXCZF29SE0n+2dGtT77vi8o+Zq0rkvIMnHSMx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IoA+eQN/FbuJHLOtN90iE/uH/FjhhGxlNydRO6Cqc4=;
 b=YDYjXzxq5oK8Y3n1HgfpwSSiFVPIF5s9hklAcQtgH853E/PmU2xvNcbl/NRoIO2CMmQthHOgaEq+ek5zabSVgFXrzuzWPPaahlHH9basxSEqpdYfrpm3eabuQvIXyowMmW7+RhJB+/HbH459PDMIPVWICfGRqo3nO+jdUPuxZik=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:20 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:20 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 08/22] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Tue, 26 Oct 2021 12:12:13 +0530
Message-Id: <20211026064227.2014502-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ef5c09b-1d1c-49b4-f3f7-08d9984be632
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB837915EFBD68C79036AFF7A48D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdPjszVMWLAyvY1W4VRD5X0I2ILlUcAJBf0cL50JC5527zGBkc4Eez5JXdj6mE5kCKz3bUVGnLSbAxnWRynQyUzF6m/ctwVD31SoEAlQypKmFdqhVsXNKwIYTONzmWYuDpImGP0VGfXG8EHg/Y5kYYHB+0nN7PVWM7fhbOObYNaZ33gIVuk5R/eA9f2iUeq1yUQOI3AR3Tzv4llOOBRLCRY5JKkRXxHS2FgKohtHovATrg1uQ/+4hw2CJuwam1BrA1JLOCITsTa8uBqvjzwrhwWWjM4nIc5JS/9lk2GcmXORK+ijLYvesTtZeITDmAlOJh/7rcjS0e9l7KZgxXzsdzgkOlLl63c0GY3iWOdflbHHrHD8k+Gt6e3IFLrGInfF34fSA7a0GDqa8RzDyGZSF1xW5p2Bp7B6J5O5lSSbgjHzn4nPeN82ayPgtCS6ZDXolEeZKfXb21Gl7SWmlLrlty1JeURoQUX2xYBZWQcWlxGdMe5pAYiVMtnIL3Mfmt+F1ow1W6QzNxg4fur4a+5uMKJURLXAqCTlRSe60CC1v/VEBnK1WjVxh17nWBNOjWdx2j/xLIjmQHyFftMl2jys/oktvakLQv91uCvFSk8JWzVXwCFtzp/LQMK2tCRJc0igrZ7C4gBfw55Zcub5v+sChJt+mwqrF+m6bjT8qAh/F9IdrUXBTFkLCizQQs3DsrV7FLerPYEQrdH6wbIkV4/BYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t7OJuXTxSOC5ItA2iuOi6eB8W/DRnr4cH7D2TWO87FZeawau89d3ObuhNRTW?=
 =?us-ascii?Q?Z5OTL6OYZZXGT95I42PmfUSqD+HNpI9enQVM3Jl0Ed5T2ufxQXOdG1kFZgLZ?=
 =?us-ascii?Q?RCMxYdrl6BPm+THVccKcVl4w5kZ0SBTn1aoynGbYf7Z8c+Lx46h6mI1G0g5Z?=
 =?us-ascii?Q?o0AlKr+XB2DDP4G/xr9lF1SGjIhbROVEVvvlmGhnLYISo97E+His5Rl8/uEa?=
 =?us-ascii?Q?vapRRPpS5JgdGwooJcmLlUFexUEJ6sIJg6zATun9yTZAdDTNx4FVOVw0Z95y?=
 =?us-ascii?Q?RIDDbSOgusgdsLGQjjheHRt9eabcr8zq/zuwdj52aSTFZ0y8q3RiA28E3cMM?=
 =?us-ascii?Q?1RFxttIl7mERGzVHIM8aEKWMo1UPk8HDYCFR/X0eOILnE4rIjkCsPNahcUn0?=
 =?us-ascii?Q?wISJUDnHDJ0tEC4koARlz5P6Hh68UErgqnu4NcPaL2JxM+Zj0KE5eioxxlGz?=
 =?us-ascii?Q?W+BBgr0iVupTkBxfE1qFgBj0VgOBhfgC1VgQH2i3Zg4i4p0L4tKShmxxIoB4?=
 =?us-ascii?Q?xNxq3JsT9ZR3z+HiJ2+og1bcYxWLe+m/3rfRNyikcJuPsUgycl9v9aLc3sxN?=
 =?us-ascii?Q?XBSJ+sikKlu5eoSv1fZ395ve9G38P0b5YMX3YhOtov43yQHsQLtgF0zmtBja?=
 =?us-ascii?Q?17oI1IE+Mn3wBGom4fOUI+Wq85p8DjzobERIqMznYaF1pFwwbYSBqJWqzjBS?=
 =?us-ascii?Q?HdW3L6ViiLNYB+TtyxMlty3pyEoBqXw8crfcjUig0spfrDDuzslRtvQitBGY?=
 =?us-ascii?Q?tlsgM+q7hBSxEE0XkceDeHUnm8oR3s1eQxdEFJx4f9yRM6TVDvZe8hxZObat?=
 =?us-ascii?Q?u6ZYlnqNnCeDQZc4O+jfMKr10QBPTqqZeVRnbndEY/lL4jXno4/uoWVLQTDK?=
 =?us-ascii?Q?ohcT9PB+AEUCJEjVs3fq08lq3FeZZR5/RmfGvRPjwDT4TrJowMl7+PbkiGL6?=
 =?us-ascii?Q?Ie5qWjn4We+5O92KZPO+E87ewTZu8ophj3Z2oXdLEGb/dQjg2VadlzAjrRcY?=
 =?us-ascii?Q?Iz1vZqaW39uF4Fud2PPV1TjHxeMJeQJiaDhh+iepBUkrzlMJVYFckPCgQTYW?=
 =?us-ascii?Q?vk12pT2Tvv5hzV+ZVwO+wkaR6BDf/IzgU1RIpfmBRq6NbTNov8L58E0JsLau?=
 =?us-ascii?Q?usK0HwFFyXsvlLrwADviGRztmM2z4Birq44cEtBH2P+2w/l2BkC7258ciciC?=
 =?us-ascii?Q?Bw21UpJAZBCWEtXL7NqdAuADDeag8isfm1l387+vftoFk7JQVTgYWIND/Yxf?=
 =?us-ascii?Q?f6IBAsGujDmnVfKO0+tWR4RwZdbjpAsSpcuUxnpm1AWgo3dErk4ex1z0Wc2y?=
 =?us-ascii?Q?zVU96qtPa3MUjl4LNAIW1yx+jUcfbNGzRguP4LQeq1HjhQ8XiAudlryM4EP8?=
 =?us-ascii?Q?+Jgd9v2/0Lvzdf6NrYVoMEImSCcuDi+uskP2YTfLTnF5msRsnhpMdJOKpnr/?=
 =?us-ascii?Q?uq7cPQspxZirx4Qk2F6BPDyrh/dkeUSzSupi+sU27zsCEqVR9KbvjsgdSOQ8?=
 =?us-ascii?Q?ZVx7hw2F0kSljYhAy8YQPJvDHut0RaYLGIcCoLL21J6n1nJ/YDqYjEcFtaZc?=
 =?us-ascii?Q?ZrePC2hXk0gP3rzHCZLBLc7T4v1DS1/tDFTy8NaqLrD/jgAnmWQpdifEgrJ6?=
 =?us-ascii?Q?WiqsEAfopwujxAh8H9S2b1Y=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef5c09b-1d1c-49b4-f3f7-08d9984be632
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:20.2600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2YiHFCD3LU797vFaNsjqvyFJ78gJzkY5AxaIsADi8AUUEIWmk+By26Pcuvm4QRBSK+r1mPMmunhU/G9KyNQsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8379
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:29 -0000

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


