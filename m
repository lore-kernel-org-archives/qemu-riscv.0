Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z6-0007ra-EW
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z5-0007pl-Od
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z4-0007vc-Bv
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:47 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so5449420pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832905;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSMNIIiNbY/Z/kSdE82Qh/Y2QcKhNFcRwfism8ERmoA=;
 b=l5nzdD6vzGINnZHAEecWZKTLbj6S3oc0cOn0/pH7ZduMliM1NZFRxqc1Ox4ice/saT
 l9QQcMyyTfkWOxiw/2dTJKB5rlH9cbLhtj0yELyZkuf55TVCbtwi+lwE26K8jpNEX9aq
 w+jqP60nQo0MO9VzwBOyc0hYncOghA/PrOCifb4T50SDTh29UkseBPvmz0hLWJRneAm1
 BARExRwfxIlOv4vkz/GLeNI6oFRYCjKZnvqhfHdIIDFSZ5tbtD6oF2fUVKPt9zR2amAL
 oACbaYOgvBU9BS72QD+/zHf+CsHFY7TtBYb89lHTZYalvjlaDVo+PZOI6BJMjDWxdfl+
 EDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832905;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSMNIIiNbY/Z/kSdE82Qh/Y2QcKhNFcRwfism8ERmoA=;
 b=1vdHmCSROT7bXalSMMLfQYvvOV7nHTeFWALnLd80N9wypidirg9UlPKMGep+K+OyuS
 8SJwuioY32acuRjSReUPCIdp/hfz0ICg/FIKsKtF2Dpa4dpLbgC2MsUxauOi8GwZHlHY
 nGrXmD4WbsZfQAn9mXur791JVqUW47gZCd02rWFto7Zvqx4gQGzXG7yNyVunu5B5usG/
 ox5qkMTb7YIZTkxq6TKIkyrFqFT35sTNaZGHMx7I5n74E/NmyrOZeGCUcDZ6HpSRfu38
 OeQx0vuowE9HWU05MG0HDmj/itNhji9sSVUo5zHnbTIk3DAzZt/9wwN6MFsIIyb9/qCM
 7Jug==
X-Gm-Message-State: AO0yUKWrYgnlya0JxmFJFZORWd3+ZK+oSg5j3rX75ehojEDA7tM8MGLZ
 DuZOI0Ub3xR/bUv6TC7G3XW/wfOjrgx43tg1
X-Google-Smtp-Source: AK7set84TK5aA5cfW8upcqn3WtXG4rSm6qDZYTiTdf6Eu4XNX2d1sJ7CPa5n6fVbUlQoZx2mSaHPgQ==
X-Received: by 2002:a17:902:d492:b0:19c:b7da:fbdf with SMTP id
 c18-20020a170902d49200b0019cb7dafbdfmr1530397plg.26.1677832904739; 
 Fri, 03 Mar 2023 00:41:44 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ki13-20020a170903068d00b00194d2f14ef0sm986967plb.23.2023.03.03.00.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:44 -0800 (PST)
Subject: [PULL 19/59] target/riscv: Replace check for F/D to Zve32f/Zve64d in
 trans_rvv.c.inc
Date: Fri,  3 Mar 2023 00:37:00 -0800
Message-Id: <20230303083740.12817-20-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:48 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Check for Zve32f/Zve64d can overlap check for F/D.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-10-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6f7ecf1a68..9b2711b94b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -41,9 +41,9 @@ static bool require_rvf(DisasContext *s)
     switch (s->sew) {
     case MO_16:
     case MO_32:
-        return has_ext(s, RVF);
+        return s->cfg_ptr->ext_zve32f;
     case MO_64:
-        return has_ext(s, RVD);
+        return s->cfg_ptr->ext_zve64d;
     default:
         return false;
     }
@@ -58,9 +58,9 @@ static bool require_scale_rvf(DisasContext *s)
     switch (s->sew) {
     case MO_8:
     case MO_16:
-        return has_ext(s, RVF);
+        return s->cfg_ptr->ext_zve32f;
     case MO_32:
-        return has_ext(s, RVD);
+        return s->cfg_ptr->ext_zve64d;
     default:
         return false;
     }
-- 
2.39.2


