Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA05C52D7B
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 15:09:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdt8H-00049z-NJ; Tue, 13 Aug 2024 11:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5955489c63=ian.brockbank@cirrus.com>)
 id 1sdsy5-0002nz-9M
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 10:57:49 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5955489c63=ian.brockbank@cirrus.com>)
 id 1sdsxy-0001HE-NT
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 10:57:49 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D5nOti007280;
 Tue, 13 Aug 2024 09:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 PODMain02222019; bh=aQYUpP3IUCdul8zQ8dD7DN6z9xx2RomNZfABpuuleLs=; b=
 cxCyCU3G9lULGwEvDHVqksVlD2REEBoC4/k3PoS2j6HsM6UQlDsGphNewPz1cfSH
 0gZ2sm+blbjEHKTV9f//oODx6K7Yh3KRSz863+3CBUuA20qiK8ShVzzuiw231QtU
 OjBVFMcbQDyFa4nHHdN04+HJ4YyuThTvJFNHlkxno/59YfolblXkyai3HGKeKsGy
 ot76/h0aKQK95rnU0PUac7Pb8I7X9vLfLwWF2XsppmYthKKff7tO8v7wX/PBio8E
 O2FweM0tNgTaOdcbGwSUuRCwcPgiKdI1HAhF8sYJ0tdpQfTbyLmNv14yQWZCazIE
 5MBIYLtDa1Nh0LzJad6PQA==
Received: from ausex01.ad.cirrus.com ([141.131.3.19])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40x4mhkc2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2024 09:57:04 -0500 (CDT)
Received: from ausex02.ad.cirrus.com (141.131.37.96) by ausex01.ad.cirrus.com
 (141.131.37.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 09:57:03 -0500
Received: from EDIN7BQBTG3.ad.cirrus.com (141.131.38.212) by
 anon-ausex02.ad.cirrus.com (141.131.37.96) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 13 Aug 2024 09:57:01 -0500
From: Ian Brockbank <Ian.Brockbank@cirrus.com>
To: <qemu-riscv@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Ian Brockbank
 <ian.brockbank@cirrus.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Update CSR xip in CLIC mode
Date: Tue, 13 Aug 2024 15:54:06 +0100
Message-ID: <20240813145636.12223-6-Ian.Brockbank@cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813145636.12223-1-Ian.Brockbank@cirrus.com>
References: <20240813145636.12223-1-Ian.Brockbank@cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UN3uYlIyjcq9o7UAF3gYtua3YkBaQqrU
X-Proofpoint-GUID: UN3uYlIyjcq9o7UAF3gYtua3YkBaQqrU
X-Proofpoint-Spam-Reason: orgsafe
Received-SPF: pass client-ip=67.231.152.168;
 envelope-from=prvs=5955489c63=ian.brockbank@cirrus.com;
 helo=mx0b-001ae601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Aug 2024 11:08:14 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Ian Brockbank <ian.brockbank@cirrus.com>

The xip CSR appears hardwired to zero in CLIC mode, replaced by separate
memory-mapped interrupt pendings (clicintip[i]). Writes to xip will be
ignored and will not trap (i.e., no access faults).

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Ian Brockbank <ian.brockbank@cirrus.com>
---
 target/riscv/csr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a5978e0929..276ef7856e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2743,6 +2743,12 @@ static RISCVException rmw_mip(CPURISCVState *env, in=
t csrno,
     uint64_t rval;
     RISCVException ret;

+    /* The xip CSR appears hardwired to zero in CLIC mode. */
+    if (riscv_clic_is_clic_mode(env)) {
+        *ret_val =3D 0;
+        return RISCV_EXCP_NONE;
+    }
+
     ret =3D rmw_mip64(env, csrno, &rval, new_val, wr_mask);
     if (ret_val) {
         *ret_val =3D rval;
@@ -3294,6 +3300,12 @@ static RISCVException rmw_sip64(CPURISCVState *env, =
int csrno,
         }
         ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
+        /* The xip CSR appears hardwired to zero in CLIC mode. */
+        if (riscv_clic_is_clic_mode(env)) {
+            *ret_val =3D 0;
+            return RISCV_EXCP_NONE;
+        }
+
         ret =3D rmw_mvip64(env, csrno, ret_val, new_val, wr_mask & mask);
     }

--
2.46.0.windows.1

This message and any attachments may contain privileged and confidential in=
formation that is intended solely for the person(s) to whom it is addressed=
. If you are not an intended recipient you must not: read; copy; distribute=
; discuss; take any action in or make any reliance upon the contents of thi=
s message; nor open or read any attachment. If you have received this messa=
ge in error, please notify us as soon as possible on the following telephon=
e number and destroy this message including any attachments. Thank you. Cir=
rus Logic International (UK) Ltd and Cirrus Logic International Semiconduct=
or Ltd are companies registered in Scotland, with registered numbers SC0898=
39 and SC495735 respectively. Our registered office is at 7B Nightingale Wa=
y, Quartermile, Edinburgh, EH3 9EG, UK. Tel: +44 (0)131 272 7000. www.cirru=
s.com

