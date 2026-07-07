Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82834C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:11:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1ph-0003bn-MP; Tue, 07 Jul 2026 05:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pg-0003bT-Vx
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pf-0002IX-2D
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493b6f1b14bso15211005e9.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415470; x=1784020270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EP6HXXrI7277SJvHWFhPbL5YWllqc9+TyVwnaeJ0UeA=;
 b=j76KL9JfwRTRNIWmz9QnC1QvLkvSq1t5YaLYIxbCkLh7umCtW223H5rYoMEDdmxinj
 pfRt7aQSJOhqIp4FgDTxMJftuNxVBD6MiIg2tOWgCLMOybXOFyQe8Ft4v5uIFG0g8HwN
 OUdNuxxn/mzCBGp2rXmtG/gZyTv4+SlendXUieINuE2JZ+S3PA5cL8sUdB3stCO6LRw/
 g/mVzD97qEJHbZFXePplVA5fKTylTUiDy4gBNF/hKEcNbwEIFG7/GbOmhMcUhE0O8nvz
 2t3Cq+gdlRi6+KidGyT+/vrLyEvwq/yH0ftnx9lVYZbjSCzALNkLW82OnZ38vNWCpE9V
 tgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415470; x=1784020270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EP6HXXrI7277SJvHWFhPbL5YWllqc9+TyVwnaeJ0UeA=;
 b=bUmT6f/pjAkILz+YSiP6NGpnWi6/FBqFfDLfT2BvEoSz4ZDVMTFj2aNLvWSg3ciHIU
 nZodK4CjD4bcccSBZrt8DDPr9cohHGMPkE2ieCxJZwTcbvZBPcbDJbhShtnkAdApWlGQ
 oxGMqHEjKLDYssfKNJNwaD4G3q0jaocAerNMQwvNcWGY30aqDhUwEP4+WxbS0Zep77QG
 7SAztXVndvg+z29IqAjmlrOuqR227A+pYYqAFauWEliYYjXzB4Lwc16exMxpzT5bKSQn
 jnnFF2U+/xBMlz02zwT4vaQkicyroaWO38jH3eW5Df/clws3Wmis5R+iSzvRe2ZsCi1I
 31Kw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWPVr5Czbt+amAu7o+J5+YXtfsOgNmlbXvt8S6fOdqtAmEPNvvEf3KTdgfYRVwmepQRIZjN2qlToSX@nongnu.org
X-Gm-Message-State: AOJu0Yz7Hjm6ke8ekZhkVsNOiGpr+TKLIgrPqhtkHNd0OVVh3XecNjy5
 Adox0jALWtlMvQIC02yO0H49MjlTs8nSbTkiCBv9BTXqsxt0ReaK6GFNTQ9zQ0xDidQ=
X-Gm-Gg: AfdE7clC/PANIhZaczGm9MMe1xzUcn7+hCERr32VgqMDfZOA3/eVLZWe6VMBBmUomvf
 WZ3/JGMHx6fWzSTERNM/2Z8+G5kJ4xPMjiw7ZhqeExj2fBxlcvLV0HSllpr0MdEbxpFl4vfedd4
 YunzVU9pCcR9/SbII+6MKSrbzEfYFRhSZJmSDy1Wltsn7JenpAynot2AE/D0FNMWcqYM1ZyfM7r
 etrvn+NHy0m3AxaL3kGAu6BHxe5MFZZOcD04Pp2z6jbaOLeIPB1S5ctV4myAaavvVJzyCAwgT2k
 nAWquL+Tvk2mnwVeG4oyaUcNTZorFN8ELx01K0Ozf/yRJPIbXU/vbs1OlUYl/p8i+fBQhjTXLlc
 n10ez29BOuF3DMTv9qMyF8DsChFzqmcP0+ySQzBhN5TxykZjrOuXXh8Rs9DFK4uOpn6/tg1b38d
 JKZ0SbC4TfWXRvHyjDOAm7RW4/EVKTL+fuhUTnKtO3ZXVFz798mA==
X-Received: by 2002:a05:600c:3551:b0:492:6efc:7c60 with SMTP id
 5b1f17b1804b1-493df093984mr46588825e9.28.1783415469680; 
 Tue, 07 Jul 2026 02:11:09 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f32660sm41004665e9.2.2026.07.07.02.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:11:09 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 5/6] hw/riscv: sifive_u: Align ROM reset vector data
Date: Tue,  7 Jul 2026 17:10:38 +0800
Message-ID: <20260707091039.2574638-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707091039.2574638-1-frank.chang@sifive.com>
References: <20260707091039.2574638-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=frank.chang@sifive.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Frank Chang <frank.chang@sifive.com>

The SiFive U ROM reset vector data needs proper 8-byte alignment for
RV64 ld instructions. Without Zicclsm support, misaligned loads will
cause exceptions.

Add padding to ensure start_addr and fdt_load_addr are placed at 8-byte
aligned offsets and adjust the load instruction offsets to match the new
data layout.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/sifive_u.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d923f041e06..4c05d94b971 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -562,19 +562,20 @@ static void sifive_u_machine_init(MachineState *machine)
         0,
         0,
         0x00028067,                    /*     jr     t0 */
+        0x00000000,                    /* padding for alignment */
         start_addr,                    /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,                 /* fdt_laddr: .dword */
         fdt_load_addr_hi32,
-        0x00000000,
                                        /* fw_dyn: */
     };
+
     if (riscv_is_32bit(&s->soc.u_cpus)) {
-        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
-        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
+        reset_vec[4] = 0x0242a583;     /*     lw     a1, 36(t0) */
+        reset_vec[5] = 0x01c2a283;     /*     lw     t0, 28(t0) */
     } else {
-        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
-        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
+        reset_vec[4] = 0x0242b583;     /*     ld     a1, 36(t0) */
+        reset_vec[5] = 0x01c2b283;     /*     ld     t0, 28(t0) */
     }
 
 
-- 
2.43.0


