Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscq-0006iJ-S5
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfi-0006Bk-FN
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:26 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfg-00070J-T8
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:26 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d4so2378481pgk.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ic2duLuZ8JRjT/p+6OwCQlMs47Nb7niHlr6gv2U1W+g=;
 b=UhEGnoFuv/oBNtQJk13egRwqGRp3ggYSNJXxFZHsBpbzrDL2szZ7rdkuE8glM/BOQg
 JE8EU5Dw064740Si3mZiCalTHn95KDPQ6atu4rCSuoz9NBE0WNTCYIKkbFeNtzUCpyuH
 Cczjes85aeYfZCtu3FNp8+gPcHU7DuUrOz7JRFZ7wbSiVVUIfciY9jX7IMnC8BxAkIda
 Iugc9NfVbVdthAjVH0flSX2H1Qdu6jqEcZ/ICGqAbh/ZvHOEjcPciO5vmUIcSTnNwj++
 qcQ07Oq29fCGHe/sos6Q7yRJ+do3BhJJpeNCnN318hdLlvXqriHOWo1ZKuK6qYn/SdmT
 ZUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ic2duLuZ8JRjT/p+6OwCQlMs47Nb7niHlr6gv2U1W+g=;
 b=YSJvg7KzXfnBMdFV1ek2sI/xoNX1oOPF6WrW8TFttcCiD2We02jDAsMWyQu/qnXtFo
 pLed0J/KmFy0LrIpykR9CpGpxxU5wukU6mAhwuaZz95a4n66NscHpmungZvIm9H4rh46
 tDGjoN3XYVuLoz3Uoau1yawSks0dwvGMUL6ES56D/jQoJ2S4dL77+exY1JGugQEeEY9E
 FzjPGwFCPDt7fkNIoBIc6X5MBCUL097rMPYnABVIZbyrcegaUMd2aepsXpZ3oAWMRsQs
 LAF/UqhiN4al/0ueOGsEf87PpIi9ki1Aq6vsWA+1GLGXTj0YdELMMv69141ByP8TXdV6
 313w==
X-Gm-Message-State: AOAM5307vDZUfhsYJyYTfpvMksyLAi+P/gaKUl6EGROWB7/A02HXZfEe
 6Zf2dUUZxV4zxW3sallsTGvu3A==
X-Google-Smtp-Source: ABdhPJwNDVdl21TtMmgEEYUlsSNG4RFRSdrdAG0i39u2kFqO9FBI+i7NADvELoshQ5TRhfK1pLNjfg==
X-Received: by 2002:a63:230e:: with SMTP id j14mr57391297pgj.107.1594378463681; 
 Fri, 10 Jul 2020 03:54:23 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 57/65] target/riscv: rvv-0.9: floating-point min/max instructions
Date: Fri, 10 Jul 2020 18:49:11 +0800
Message-Id: <20200710104920.13550-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:26 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 42a48be5fd..d617d0dfbd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3831,28 +3831,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4, clearl)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8, clearq)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2, clearh)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4, clearl)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8, clearq)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8, clearq)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2, clearh)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4, clearl)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8, clearq)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8, clearq)
-- 
2.17.1


