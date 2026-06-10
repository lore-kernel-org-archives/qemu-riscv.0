Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733ABCD98CC
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 21:42:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXQgP-0006oq-V3; Wed, 10 Jun 2026 17:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXQgO-0006kf-Tr
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 17:41:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXQgL-00032H-4E
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 17:41:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AJYUPv2471531
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pZIAO/tzWro
 CgEzjpoZj5lnjJ7EetIqK5We7SK6ra5M=; b=nNQFwXvGYTOfrjGM/o9XkJmv0Ak
 eQZ4dh1FZgN21meXmkzT4ufQb+qsrrWEwNhYD1g5RbNHpi7lqd+rh7ru72G6Qly3
 cgxzBjupaSQqWQeIm2V4GUnmK05niPQUd87nEO7OZTyjegEDBqVyvSc9v82lDXtQ
 JC9RHpjbxqsa1tu1f/C3jRB53GOK1cq+1nA2clQzgVxlbbBLM1o7JyswcK6dwgbd
 zqKEjJrEY0LEzH7RnTKoDpCJp4h1y3ibt3r+GUBL2X/pMt9+IDIoyqvxZ4Hb55GW
 DUuNSl4fywyMl0wl5hPXTCfk9ntidbjqZSVgoM6bbR8CIrvwwl7elju1inw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u8ewj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:41:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-517a00fbac6so26103761cf.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781127710; x=1781732510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZIAO/tzWroCgEzjpoZj5lnjJ7EetIqK5We7SK6ra5M=;
 b=CvA6zVWhBPkrUm1GChsDuOFpF8xBfR90aaIBrxeqNe8uvHm4AOuRo1paLGyEQt9esa
 rJQdV5FBpIFLbwSRYbkEO4f+vFpSzdhJDGjh32aPvVKxYWITzwhix1AkbtcsMkyaDe2U
 YaIz8QvTaywarEDsxZNA2AURnIG/JRViLttLgNWw0hzINJ/H8lcWmJaJxNSilJfJ5SgM
 JLWKzn3ivURlzNgrY2f97glCiBtDyTMGF1Fvei7OeWvn4wjzxFQe2wlHyPu6plNKkn2b
 Eu/Pu8/Qt7cJH9J0GCGamDB9+MHDN34YEz82voy3MOCx4BEVbomU1B5ikDl4uFZsMacZ
 ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781127710; x=1781732510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pZIAO/tzWroCgEzjpoZj5lnjJ7EetIqK5We7SK6ra5M=;
 b=IpfsTegRkC32ad72uatw+e1cSZVzs9NB4QueqKjzKGIYu1BcQtv7kdHjtd09dpbRz3
 Z8XTf42Hx+QteXi/8PefjPffhF/y8G1eWPqdEwiAmrzLTuchVK35jfDU+/kqjzx6gDRF
 DdrUDP1pCZz6e2RTPJz0PyOOuSWaVmhGLotznZGQ7M7e+asa2FEvCkKT05VwCUDlrnYb
 jRJdA7umKmBFxrFj1kcVsmq3OJw31MX7n5CeYHWZMM9I6d2T0FQ+fS5CaRCN2RwF8IWA
 5YfwqJoCUX1oOEgBfi7ywO/rK2Dg+OUBj+84fXwdpl9k9U3nLnCnUEhJJuoR7x6HHzAr
 3wDw==
X-Gm-Message-State: AOJu0Yx0NEJ3K9H4HEgzva8IoFxPEzsxfgf32GKGBgBiiXzCwnrkhmNm
 8HhSKR639magy8JH5BZVzozj611RMakPB+2pbrm8h57PDbRRMVQMalh5UgMkAJwH5H8sdPGT6jO
 xRlTMphJm4L0ttFhk+CDoPBd4u64MTm6MRzqASNNCYS8hXw6q6/re+ZcDwQ==
X-Gm-Gg: Acq92OHvLp/MMzR/8LRa2rrukbzoSiBU6rKXb+V4TkqxLhBJTeujOEIMcicu2TRT8KV
 PaOBFpQzL/LjQRjIk6WXzdlSSF+FETAvv1Gf4yjidtNtYS/A866brSuKBIAXU4P8tENR+7sory0
 /Uc9+A+soKN7wXctUJID0PUcdFwCRH+uB01c8b2gLa4j+bMjQjWgNGybW8InQ+qZUskWDkKvEHW
 EywQLs9K8jFbPDzpNAoL686yxZBSxdZ4lPI/0pfJ/CM1PNt+F2GCR7PPDG2cOs446PVxp9iupZc
 ixUWU5tpaUejBttORl05W9JKGBmBGC+das6vV1vSeawnu9elyHD52uxjEV6XSvweulb2nwJC2Bn
 navMuEh1unoKo99h7wk4Z5E4i2/N8NcfhJ5WKxjxO9WD2aIb40PWNp+V5cfoqUslD22pb4w==
X-Received: by 2002:a05:622a:511:b0:517:57f5:e21a with SMTP id
 d75a77b69052e-517ee28dbdcmr521091cf.41.1781127709820; 
 Wed, 10 Jun 2026 14:41:49 -0700 (PDT)
X-Received: by 2002:a05:622a:511:b0:517:57f5:e21a with SMTP id
 d75a77b69052e-517ee28dbdcmr520491cf.41.1781127709293; 
 Wed, 10 Jun 2026 14:41:49 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6d777996csm20766280e0c.7.2026.06.10.14.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 14:41:48 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 uwu@icenowy.me, Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v8 1/7] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Wed, 10 Jun 2026 18:41:27 -0300
Message-ID: <20260610214133.1882563-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNyBTYWx0ZWRfXxFbf8bXkZlgy
 eVY+3ioSdusVmoIb4CAvWZu+sjgI89coYlQ4a9NzUcdbDbwqD9OpfmgsI6HVX2PBkVW3O+xx0jf
 6GnwlVzF0wteXVyJjbLJlFFt1sabpq8=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a29da1e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=GhL2bEVCvcqOW28JNKkA:9 a=a_PwQJl-kcHnX1M80qC6:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNyBTYWx0ZWRfXxi6iFTJLgQ/S
 0mUZygAkF80+7Aw3wWne4qvolSRJ8zoqjeoy5KuRjPGKiu4btmioXo4Q0yD5wxanwsSQ7J8yzke
 83Oiam9unccSlf9qhi4fXlztCJwL5UixPTch+xRe/rGLk7h7hPPKOZ2cWwbDBaKGNLzMNqpSBNb
 fCM+RICHGb7J/VYQZqjy5o7Bn/hgYIgwwp4nJ/5bO9oRswCdQ7T07LVi2QghwCEdySXANl/7jFl
 VK4eyw+vfHrGrekbqU/+s7GNl6/8e1xBMbMdImTsnGp1ecCvYDYLz3Gc4eMFgkBf3aatKqb3Ry4
 NdpqUpNCX8FgGZVVtdGjCbXtENcmlrR45hbJkn79MNyQioWFEzCybsrv+4KOHUBA2fWJAUVh9uy
 WU7JrLBPj0VZgPp4WYmFri4SwyHigmyqHWl5nPFGTKXtIN4trj6j96M8omFMjY+gsyJOT0KQVHw
 Do7Q+db28GU1BJA1tbQ==
X-Proofpoint-GUID: iYdjPj8bWVPDwYWfu31OLUctHzFEgFwe
X-Proofpoint-ORIG-GUID: iYdjPj8bWVPDwYWfu31OLUctHzFEgFwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606100207
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We want to configure other CPU types to use profiles as an alternative
to adding every profile extension explicitly, i.e. a profile is nothing
more than an extension bundle.

This means that a vendor CPU can set .profile=rva23s64 while having the
same handling as any other vendor CPU. Same thing with all other CPU
types.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6423f2d548..e02d53cbba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2744,7 +2744,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.43.0


