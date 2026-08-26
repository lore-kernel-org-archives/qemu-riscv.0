Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32EAC61DC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:49:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLSZ-0003Gq-KC; Wed, 26 Aug 2026 17:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSY-0003Fv-2B
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSW-0001Kq-DU
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:01 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdPkx2001312
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qhlM4AGMyCVZ95dreHz0+kTWKwM4+JZGvYvBNFPS+MY=; b=JzH4r8B3ZRC2ePMs
 QVVbT7dV60t76LQ7DMSgKhxdrGP/SPti4hTHN7omXsCRjW9MBC+3LtVjYZhpJBtU
 U91M2ynCkMHqThXayT6PxQGgotCpHHg3H/dNJwJ1QfztVWkWyyFWimbPm7NReOnp
 m3nT4RC0gR2obXwc3i8S8TFkd8u52O0kX/JesQwjDbh/aOjPiR6v1lEkKUZG/UJS
 KYf+4Qs6eS2Cao29SxO782VFSaOtZ7mmj3Vf3efQE/ag8VzYH8E4mV2Car11WjSl
 JNTNFFfn+SPScNv+1Knb473XZTOH+jBN/kDr7jXE1mn0ncGiE3R919yLA3p1gS8A
 0pQKRA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ec8w6a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:46:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90c8cb9f37eso14198596d6.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780818; x=1788385618; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qhlM4AGMyCVZ95dreHz0+kTWKwM4+JZGvYvBNFPS+MY=;
 b=ga0z/szv/CSrcInnW5XjnJ95I/5mRp3wBOsr6Og1qbXhHRYpmDvc2cpfmpqYswmSJS
 +KzkeMZZBaI6Sr73aix67Ul751UmZZMqhYjSkmv+uks39wHTmJCfZETrRvZ7FI/hgZZA
 vp4C53a+AHKfb+UI0J/JVBAsPPmUhfLnxmK9KM0LwecCypJVEM8D0JW7FxMum3gmN9PG
 44j0UzDcyF1LDPOgXQ7oT5Ez1Njy6/UpoL02g7kj7QD9p0nJyg4bKFYNk4tG4XdWPHBt
 c/MCyOywk1/xZ/LIdxji+uHlVe3PhMystU0e5y/eXuVd8Ohm0e0AJVEXE2B5W5T/FAMB
 BI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780818; x=1788385618;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qhlM4AGMyCVZ95dreHz0+kTWKwM4+JZGvYvBNFPS+MY=;
 b=hWdx00tv/qrHgilTuvNCzx3FkcMIC56NGL1lEyZgetElG07lRZo+m1uItkkhRg6Czu
 TeKlhbZiTUdLrh/vF16prYs3se/ZDdnto2TcikHSikmBx2sIP7fiZHf+a4bIqHQTJNa0
 U4Rwc2fG1MVeNKzsBVq8p4qTjcz/7IN1zrDKtVRtrel6YvElA9N3VuPwD8H4le3lzl+o
 XBtWPHZn4zzlz6gOpGsQ++PHLzBxajmnzcHBd4b8mATMHPoBWUm3Rc3CL2cU0amq4VJW
 1ITSejC0EHWuL3uVwbSWqIbnHJYGvzvXQ3UuItoIcxRQOOAvFBMgCIAF2U0ew5eny+R2
 0ylw==
X-Gm-Message-State: AFuF++nIeury23EikpD2R5CzrjqBSSeE27EVRKjOMaq2WDEiUQGg9n/9
 dxZ6WADnqDx9LTd2Y6o2/bWUYgcyQIBIjQ+B8MFFr4FsTeT29Lf+PJskUGqhfVovk4sBOglhnS8
 Rf+lx1gIoVExZarVmjwLLME3RseaEO8xb+EitR5d8bfXnhnMlgU0KL+fE/w==
X-Gm-Gg: AR+sD10KH2YrVCnpA4eaN39gtiV/YIVFcUwxw7rG1eVt1+xSp1yd7cqO0sv3zPf4YOM
 L997s93mUELWdpP4Es8jTQxAnA1laEBxFVj8hg1c5o6HLBO8DBIbi8crp5y9DJj/KfgkAoxT5dd
 PvN18SZS+T9NBoVQzQgSKy72GyJa0mKRmA+V0tTLD9xylcE9CKUiR7j/8K2vBI/NN6rn0MBoHac
 0KrK87kU+YTHbdrOsdJbTLCuXptdEMSOycRsxuO+USikVrF97KN+/7GSLUFzsNj5FKlBypiM5nq
 u+FaLh5dvPOutAkbHd4owqfRa86Df8eClz1w5SCvzUZ1pSPILqbxEPeserO6QvG9wDGwnWVkPLB
 Do84qU3l5C3OA+OV7rQU3yC5QRjRXxFApFPMOfg==
X-Received: by 2002:a05:6214:6354:b0:90c:cd19:1ae8 with SMTP id
 6a1803df08f44-90ccd191b20mr60683426d6.25.1787780818049; 
 Wed, 26 Aug 2026 14:46:58 -0700 (PDT)
X-Received: by 2002:a05:6214:6354:b0:90c:cd19:1ae8 with SMTP id
 6a1803df08f44-90ccd191b20mr60682816d6.25.1787780817158; 
 Wed, 26 Aug 2026 14:46:57 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:46:56 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 02/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_flash()
Date: Wed, 26 Aug 2026 18:46:30 -0300
Message-ID: <20260826214643.122728-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8f5ed3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=plQfXIS7czum7OicmoMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: b24IdkZ1VSHrW8nbQ6XfxmFtZYJZ24dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX53u4nU/IZPsO
 0SninETsWUJsjLUPw3Ysc10GKnWpR2RrVYTfUEP6KRsdM1zdP99ux+sb4qk9kgSxRT/zSS7NFVj
 23jZAYo/PN/8FAzP/UY/tcnJWIa+5e9Owf9PDCQ4s1LQOwT7E8pLGH+5f+IkKG9kiLzQb63QIyV
 /uKHO5qJmCgMGfOsTNkbfrBUd76mejkAgyi6/ScbUMpsEuN9YM5fjft3DTYsimMEAKS3qM5rj+j
 PIp+yFNRIcrHNB/k+GgKLzGEZL0S5yTprd8gQXpxeqvNq6z4lPfc2do8Wqm9zMSNCdLMwTXQQcN
 S/1+LDPEW6S+VkbZ9oRK9V+V3YLScfp7kJhGIzL0VNW27nS5Scc/W6+efNltxu6QD4aVS9/gimc
 e7DTJDX1kw1fH5DoJMdN1JIhf27uMJ8xJGFbdFqThg+E6csLxf7WnsBC4IDbi1LQekpLiF7TIil
 P85OClURKQItSqm56XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX3mkc417XJLUC
 JkNyTj8hoM2RoslyUpDBizp8SYv4bTJ/Ft3PaNUb8x05IKqHlKkSU3LHgH4wTe/qFKUT/lojEsN
 xU0FtxQtdOukVXw9mEbBBhwRA7Xaa7g=
X-Proofpoint-GUID: b24IdkZ1VSHrW8nbQ6XfxmFtZYJZ24dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260183
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a common helper to create a cfi-flash compatible flash subnode.

This change only affects the existing 'virt' board for now but it will
be used by the future 'riscv-server-ref' board in the future.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 12 ++++++++++++
 hw/riscv/virt.c               | 18 ++----------------
 include/hw/riscv/fdt-common.h |  1 +
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 3a8da03cfb..6fcc1ce21f 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -283,3 +283,15 @@ void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
    qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
                     fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
 }
+
+void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize)
+{
+    g_autofree char *name = g_strdup_printf("/flash@%" PRIx64, flashbase);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, flashbase, 2, flashsize,
+                                 2, flashbase + flashsize, 2, flashsize);
+    qemu_fdt_setprop_cell(fdt, name, "bank-width", 4);
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index db0f7ecb81..56b984c5e5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -866,21 +866,6 @@ static void create_fdt_rtc(RISCVVirtState *s,
     }
 }
 
-static void create_fdt_flash(RISCVVirtState *s)
-{
-    MachineState *ms = MACHINE(s);
-    hwaddr flashsize = s->memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = s->memmap[VIRT_FLASH].base;
-    g_autofree char *name = g_strdup_printf("/flash@%" PRIx64, flashbase);
-
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, flashbase, 2, flashsize,
-                                 2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(ms->fdt, name, "bank-width", 4);
-}
-
 static void create_fdt_fw_cfg(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
@@ -1042,7 +1027,8 @@ static void create_fdt(RISCVVirtState *s)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_flash(s);
+    riscv_create_fdt_flash(ms->fdt, s->memmap[VIRT_FLASH].base,
+                           s->memmap[VIRT_FLASH].size / 2);
     create_fdt_fw_cfg(s);
     create_fdt_pmu(s);
 }
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 371971d79d..b422da6aef 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -38,4 +38,5 @@ void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                            uint32_t cells_size, uint32_t ndev_sources,
                            bool numa_enabled, int socket);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
+void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
 #endif
-- 
2.43.0


