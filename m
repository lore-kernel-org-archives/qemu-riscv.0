Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvts5-0004uE-G1
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvts3-0004m2-AF; Fri, 10 Dec 2021 23:20:27 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvts1-0001fs-Bn; Fri, 10 Dec 2021 23:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196424; x=1670732424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=w/PePLC3/UAFWVolvvp9sy9+thvI3YOBHP8eA0Zyp0c=;
 b=Lo/V/nt0XecrJrlHoQMN5yQNRW9FOoPyxW+ypiSrucPUFgnRzuFFE+4s
 rZ02DhSFSiZTGHh/QHR6eRyeaVuBRe3VARnks+apR2393ExmTxNs8hmDW
 kj1Y2zZsrJM9j8eWj/wxkMXred1XXbi5sf7seUkmWknA7EP5YT43hBtnw
 6TkOvzH0qx2TBso0gwrNLyCACeA69fHdWIIFVXO7/6bhQf9U/uXAQAiPF
 scjw5DshdCw011+RyetEsT61bNtfp8nY9mx/4I9R2hXWlSs+KVMbUN5d5
 W+6ukGO5j5+yFqGotcYABJyN9DrWygwlh1+9Mxlcgj2HFmNbleOvIlsHY A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989930"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2/dEgLzVW6XgFV1NgsUQFdjnG2GV+Fl8JttFPk8krXI0D/EeOX6DegIM+/oUMhObAOzdlav+PyhVYZ35Vl+JJXQwt7xYuJSLk4Ini6EiGbe5kCbciDuAV6eDjVhaHGrNfYEcIcInctuVV8ywlC1B/LsBnxvOrVSGIVExg2vKqSRzdleC+D1xQX4lEpZk5U5Tei9tPrXtmn/I6Kj0uzzssOuLZ59N7PU2x9SR5dB2UA9c+VDpQ1okkmnEDf3RCiF/prZ/FH0yv9Abc+t3CjZg0F19+rbeADBzSwr8f8nkZWHUlNmyE7PuQpkwQ6TyC6E7gtyx7CyUnM0nq8AsORUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULCto4yQUXboBhWH4p8ZK8j5cRhfU4bPW2SOEemG3VE=;
 b=bZT0kXF8rD8PORiT1thqmbR1p/YwVcJVJXqSvkbkjfANBhFutGvCuM6FrmgMXGTQ/gpgCnsxkVO/NTkCVDt+MT4WnDA0FW8aViwecpny3lGNOZKFWHfdNDbMGezYNCQVonn1DH4A/crFozfKo0kqAzVTPubuJ3/OQK50iQvOgRnetNJ8iB0RUzyyLJSg0LwuJTY02571G80OR9I+Rrjm74MbIKHUfhqQrNGGU8A0pzT6H91/ckXpcs7xqe0u8ysTbUZBr5Na7mEXqf2s3rR3aq3ckZ7D8gPzw1l6TTv/C7IVyBA/kLmUzcos+vY+N67yMPCH78TId34HKhSOHi3bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULCto4yQUXboBhWH4p8ZK8j5cRhfU4bPW2SOEemG3VE=;
 b=XGIXZ5w6LhcWQXh/FJKoFZJYMd05/qvky05d2+66IZ+wGh04krc3GGNKu6JNcl9MA+NeeZlQaMLVFqWJvc8fLwFgUO8UazC7lIyV+Lre5ntxvuARDeHSLDDoK7zMNLjTAJeS9bgGB3Szf5MSyhBKIkSzhKA09oepbDMQz4R0cwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:21 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:21 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 08/23] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Sat, 11 Dec 2021 09:49:02 +0530
Message-Id: <20211211041917.135345-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211041917.135345-1-anup.patel@wdc.com>
References: <20211211041917.135345-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4925935-eda4-459a-0398-08d9bc5d8b99
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB82689F5AD8C2C762979A52018D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZweAVPfw62fwcr4mu0Jxv7I+0hbuZwlzCjkWSOdmNUowOB03+p6KXz9EDKk47JeZthZF+5E/zHiiQviGbWs6ko3sbIR82+RyjmNmP8i1sb41a1MIp3J9QmXUHT3lUMhrz7WmG7SeY/c7kUdEd2MHNzm7dVlDKXdbkVhLWhTA34T/JweKtab8QnWG83AVJ0YiN7PwYYDwgTG5MUwdrJDsJWHM7sr1ca/TnmKmYer4T0r/wWeXx1jikCpicaljM+4aUaseAJYs9zSPeCAFn2VIFYJd+tzuBsQUsNWOLfh+eev7fOmY29ntG/qDRnYv+zWWj+Sg/LboXgzagRl8Sp9xJygOsYbzbBzsTeLqOo6asemJ0ZG4kZou1WnU2qWMucUWG6R7fZF2+A1kwbqzw70fXtra6KcdqXFs+BrBWRfILoFUH+Re9jvJcEU+rZ8SoU5l96lg2vodDN6rwReGKw2AXnFaJ/Clwum+QfeHMjdxuonEb1l2QRr2pn/w+G6CNmeuI+qbT0ruYGqmp6rBfwy/bpSod9ODhj30LocHDK87clr2vbnV8s+iLihff3hwa0yKbNtHAHpdkk0BFPS7thM/LE2qrP23V7D2DtxpzaQBm1mz9FnMAlzIZ+v+dyLXjnajGaRoHKJRlx966hGk/KJbgdBlIQlUbHg57X+d+y4e0Zi4FXD5VnIE4Easghk19UxVuZuGzmvvbB48TJaPCczJLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9rBD9l95WQP4Pw2a1aVpqWguyl2uv3/Pgoo8rwOt/P3vVaM/AdM/8p3ZMhlK?=
 =?us-ascii?Q?sabqUZuCjoSSFx4Ff3XBoQ3UZRAxuWTJIqenhoAhFDZNuJUfW2M7DIhOrWGj?=
 =?us-ascii?Q?Qd1ewAr9vbdWNJtM/Kur1ZzIp5FNtCmR4XI7DIJwRRMzfgCKD3gmGYwHgQ7g?=
 =?us-ascii?Q?xh4zHOZwRP+4glrQQdKFSP1xMH0qNyWs8Dd6yZWgbAFaagUhrvV8ePe0b+NI?=
 =?us-ascii?Q?KjLXS0o+ZEtjflX2cWvVHyFNTuKQJlC+Kd2jpTc8MXSWhN0YcCa921NcNydW?=
 =?us-ascii?Q?7dWrPQVc3NAqAQ10+D5rGVA3ti2TQnSe94EfWUdSs2sOHdZMfJORJqVHTF4l?=
 =?us-ascii?Q?WrZzkm05SKFJROqBumn0a0cq8m6e0i9gtxpgAUb1eA0cRWzhaaJJFUa2Zv2g?=
 =?us-ascii?Q?94uCEGi4G3W7FYv94cM5sJyNygg59dai8JhAeZLKqHWKSM5gwnSe9Kg55ZUt?=
 =?us-ascii?Q?hPmdy5g4llQ607DYVS1LGFznDljD6qDEi0kJZvFMkNNzGImdTJUDosOTynAV?=
 =?us-ascii?Q?asTHwxofIq02vOIY2z+8SGy2Xh+XyN9Q+fHs6MyiqkQ24ekEzeQl/HAoF7Ja?=
 =?us-ascii?Q?xMOON/6Jql7JLtuO7+8m00wQ1BqLptUJ67UJ6aL+ebvEL3V06aVsNu63PPQL?=
 =?us-ascii?Q?ufLxYkAPbw9vfr7dBRM3ijWhSB6uJtPz78DMz9sbWQjOq7jTuRt1d7JGgvZH?=
 =?us-ascii?Q?t/57FC1QFjsD9Fp1JiFAZaMNWVB7Ags3Qf/x8YpMXLIxNuOsG6MKnJaiS63n?=
 =?us-ascii?Q?HOIxse/Yi87MYO6Zaq2PjYOJGCqwEP2EcBrlDvENU1Uv77XUzDjf7JnFcxLp?=
 =?us-ascii?Q?tyvNIVhz9OMTAltvFxthLCcpsEo8IxIQ4DTyimFz/04h/dTnM7jwIayaZvYF?=
 =?us-ascii?Q?5ltPb1ftXtDZ4ouVmcKeJ4CpdpDVn5zDXbRSsCx79C14Zr6jutknMdb0vFk4?=
 =?us-ascii?Q?8KtNLx5xyS/OwDzWSKjDMKGEl6EihT0jQbM/epup+UOKhGQNE91fiGQAIrm+?=
 =?us-ascii?Q?i/4mh+JUaPkHTFRQOFNXgZFn1wBQDl2wd/8RVKSfdkrPH+WMjEn7gFzerCSR?=
 =?us-ascii?Q?ra1cLqmstCFmg9fkv6xhfyIy4xZkpG9ZDZaNkt7LAp5SXGAqXNbW/HCSBzBb?=
 =?us-ascii?Q?0CSNHy+M3Ddziip8rIkwNM/NKhpYDNHJpk8Spq3AXR+iGiC5eV2SMUH2TK9G?=
 =?us-ascii?Q?vRQ5QRQ6EJDMenasMHmUrtyyj5G6DE8QLz3JZtwTm4Kx5b+P826a8F9l2NqZ?=
 =?us-ascii?Q?gIH5OgKrj4Pi+uxv8WAcf0fnhFzIzNxNgshGEfZ2a9y6N4K2gmXiIR1YoWqr?=
 =?us-ascii?Q?/lv+VUF2mWq1w0vb4C3zetN6Jb4bgUGYGhbGP2IEtjFNDqVpCtRIv5VxF0Jt?=
 =?us-ascii?Q?Om+WYzVxAYKUn/xadW0Ga6HhgbUs1CrOIx8LIA8ovkl/AdOE3wgmYR7o6okh?=
 =?us-ascii?Q?5UsqMuD/018qkb3+tQHOTPYOKSj8NBilNwdtzk7Wv0QAp1PK8p4xkVBYvULL?=
 =?us-ascii?Q?mnAPHiIYf1Lavt1NS4g9hE2ttL8O+xQ+11K2QOSJ51CPxD8UZ8x8xVUISZkK?=
 =?us-ascii?Q?mHfkpTCM5q9rapOxjSs35GawwBfF9fo6bYvQvSIuI+Vg58QiTEILRBlNuP2y?=
 =?us-ascii?Q?RIdHfZLN/YV/tOvVoF52IRo=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4925935-eda4-459a-0398-08d9bc5d8b99
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:21.1239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcGHaWgaOImX5vTazmaXevKN2n2I/NUQ4qDwtVEPOuWUfHpcPPS5rsJG+JEbyawEUlM6W9Sc9Rj0Awy2cgtqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:27 -0000

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6e5b6acd44..df1d792951 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -240,6 +240,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 
@@ -391,6 +407,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
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
index 1fa9f0e584..57c07ba1a4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -364,6 +364,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
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


