Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscV-0005xQ-CZ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqbz-0004n8-IS
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:35 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqby-0006IK-0W
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:35 -0400
Received: by mail-pf1-x443.google.com with SMTP id m9so2395243pfh.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gIClYh77YnToY+rzZTLHItNPlAaqhPTdCd+nqEyek5o=;
 b=LEuYT8eqtQgmCuymrPSdwWN1uE7Rq+koBF0TxKfmNtzZMGu/JRP4eNUa6WjG9ETPLr
 dA3KjZgG8bLvsRUsygC2TuanBeFeeGGp29OF5mGkX3eSPkX5LtWlt1qS8auijXDEreQq
 u770GH+K1cSkQ315ZOcjh0b/jEeawwJbRvQ2lV0qy8ST+TSYQOECE4xYjbt5MUCnj5pZ
 pIpVGcwkfqYI70g2HnXOJmvaXrGOjRzhv14pw62lOXCgiWfBU183yx6V1eNSoUpu4N+p
 nqUctDXQRZUp02x/hn38uBJqb+55nFWfFMtks06h+yy5JpVJWNRHeSW57Npkvdzq3F35
 TsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gIClYh77YnToY+rzZTLHItNPlAaqhPTdCd+nqEyek5o=;
 b=Ws8XH+/xnUnah4546ILxG5W1r7dMZMuJjP/79Q8YrMMJBks89ezdKZe6p+vxbUzXsb
 ly6GeFjvDIqrG9i4jEND9IPVJGKOo6GZddE2v5QwMUgTM602TFcUp0qs1y8GsQ3jqEbM
 xVdzdYK5kvUg3E5fUOfLC2wQ3KjpJg4V98Gv2DPXMrlftbtZN0shP9M84WajonC0EJQN
 aH6WjaybBSyEfNU/uxFgPlqarfIgrsGvXe6a3bMrJm24tXvfyepmwWt2P5dhky2WuFMb
 VTzYga6IyIHe9w8vHudXdPVE6eX0jy43O50jnts+Sqm0WP5Eu84To4V7aSa85tmZaZHk
 XI/Q==
X-Gm-Message-State: AOAM532ng3lqLE9+1qtXG52Mw/670LUboNtWhLLKekatsoNndjUeoqzR
 uDiCZdbGUHMUmPjvAQvyCZOCDQ==
X-Google-Smtp-Source: ABdhPJx1cTTD54qhMUuyphj3/zVDEMzhCmqbbM+eMuwOelyIhZsiWGqWmNNzg2OMB3tG+xfndm7Fjw==
X-Received: by 2002:a63:4b44:: with SMTP id k4mr60175496pgl.305.1594378232762; 
 Fri, 10 Jul 2020 03:50:32 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 03/65] target/riscv: fix return value of do_opivx_widen()
Date: Fri, 10 Jul 2020 18:48:17 +0800
Message-Id: <20200710104920.13550-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x443.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:35 -0000

From: Frank Chang <frank.chang@sifive.com>

do_opivx_widen() should return false if check function returns false.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7cd08f0868..c0b7375927 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1151,7 +1151,7 @@ static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
     if (opivx_widen_check(s, a)) {
         return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
     }
-    return true;
+    return false;
 }
 
 #define GEN_OPIVX_WIDEN_TRANS(NAME) \
-- 
2.17.1


