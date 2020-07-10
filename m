Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscf-00069X-9F
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqc6-0004sg-S1
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqc5-0006MH-1r
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id mn17so2453160pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AVzzG3mHFPsuqM2JRCy5Jzl40BEHC7YkQgKLxYxD8UQ=;
 b=KkjlVoop46PW20Jlca2ZJMHvKd0stl0hZl0cMf7qsNO4xpDd+ls1z+6Qh3KA3obeyf
 8fSAiaiz6ZZRFr1QpBc7CM+LVFAHnKh0n5NwQ5f6uRVhSiIQPC9gFcazs9zB1vVvX+xH
 cCN5UnTjPWt2IGCxgzv025cFjk9cG9Wqg4dTyB3SqbQx55hSOk21NWrJuZZ2rQTK1K4c
 6vNwGbLKMCEUk6lVq5JLj6kOZUISNC2YJyT6DcRdzIn4E/LvMKvVvB0EfVCgbNPemoN/
 66gisARJlqxFI3UY7mPvi17YHcZ0SLiJ4hgEAy+R6NcTJ9wnfDcaSQF1TnJM+V1Bn5lU
 IxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AVzzG3mHFPsuqM2JRCy5Jzl40BEHC7YkQgKLxYxD8UQ=;
 b=E0nLLjhOXfNMD1Qjk3fR+EBFSfd30n6sQnUox+1ZcDhmMY+kEB7f5mtEkA4QzYJw0Q
 zXpkOhkw24be6ps2bfpa4neQJcWAc7QL3wE7xGmHUImkbxjZizFs1PtXrJGi7oFsH7Rq
 IhV6VrWyaOOXyLLD10p8st/+ZDg5A0pU16vMjAq8ucF7uNqFv1UlFAQ2V928n7qGl/hz
 LCDBGHT1sPCsuKDA21XnGBeD7MQdr/ANPKVhV1iw/as+jStmh7np5KeF16ZS2PSSxDp/
 V79MDTfdJHJkD/TyzTQadvS3TLuzrYO/FrJ69j4R3VyQHdClomrAQPkj+G1kT19WABrL
 yTzA==
X-Gm-Message-State: AOAM531iywfyJo+eTyjOCdVbC0NxvdSPOvzyAx8O3sfJFDS/U8LoAlSW
 +Pm5JaBEXJUi+i4PZ1Lh8Dnmnw==
X-Google-Smtp-Source: ABdhPJzwO4Pdnm1rqKNT6GXb4lB9o6CmT/jfYAOOUvNJm3Ebvdx8hv7ZawjmoyReWAlTs3qOT7DmJQ==
X-Received: by 2002:a17:90b:4d06:: with SMTP id
 mw6mr5326424pjb.190.1594378239856; 
 Fri, 10 Jul 2020 03:50:39 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 04/65] target/riscv: fix vill bit index in vtype register
Date: Fri, 10 Jul 2020 18:48:18 +0800
Message-Id: <20200710104920.13550-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:43 -0000

From: Frank Chang <frank.chang@sifive.com>

vill bit is at vtype[XLEN-1].

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eef20ca6e5..a804a5d0ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -98,7 +98,7 @@ FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
-FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 2, 1)
+FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
-- 
2.17.1


