Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoi-0006fk-0d
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaod-0006Xi-Ej
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:40 -0500
Received: from [2607:f8b0:4864:20::52c] (port=33382
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoV-00070B-Rp
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:38 -0500
Received: by mail-pg1-x52c.google.com with SMTP id f125so7447541pgc.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3uqk/bbrB6wUj5NxyteBw8OsLoWIaRlYXSAK06k1Z8=;
 b=Y/xZsQ3HRN4oiWVwGyf3GJQplZ5ezpIPDPw6ZMILgwU1/V7w4nLsywAXCd3XpxReQ+
 fGsTlcWxs21pj0E0c3/veIygDvZ4iuw0546ZMRYN8zUHgGARzqzbZlU2RV46BWN/UhLz
 ukk3I0iOvlmGEoJZnXveS+neEH/HZ4WMJ8Exxn+puwmqvg8oGQxRHo05P+qBngFkrJNE
 WvrIsnHgB9BfsIQe8+FFrSP0W6a2+1kSaZaoXa90O/mOWIQjGWjftybel3eNa5/MMTbK
 5a3CMnuyui0+X/Ca/AEpcirx9rNL0dBlIUUTPuccTbBhORFOelm4zOtQKyPwgsU/6BW1
 x3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3uqk/bbrB6wUj5NxyteBw8OsLoWIaRlYXSAK06k1Z8=;
 b=phZsWq3kVeHWzo73gFM8HgOL1M1kOVH1wWUVZ0q6AocDUO0a5icohjpTiKCGa/JrVK
 j57S3eRr/oh37lnQT8C6unUV047mAq4x3tvV/Nfh38D9W8H8dhUSGsm9CGZXY5iYjeBj
 RvvE6o4QsvQZixfRpWSCTd8GaHWlnTOKf12XIrI9LDJS7B9q3aMGG97wcY1FWNXirNE8
 m8wWdWrl9S8xjZlWmUB7pvWuMZ+RIWO6hP71LEPOeCiluseyhrLPZUl6pi9tHHWI+2bG
 8mQoEtjOvbjrO+Zv0cLONyFaliiV8O1TD4ZuscjiDv9+kx2ybhPbJZ38n8HOLbVC3Xw7
 Jm8Q==
X-Gm-Message-State: AOAM532SHfzU5A+oAljp3uLWFsiWLYuIJb6jJ9CQz6tr5sn/E5LUH3BQ
 a/KxZjMVR4ZAw3yK7nPVhf3Rgw==
X-Google-Smtp-Source: ABdhPJz9Vn5xDZp71Vdye68cMoV7iFFLw/vskNRT+cbFdTcC6fAePmVJMXon3M4VWaYmg8JCYvhm6w==
X-Received: by 2002:a65:6895:: with SMTP id e21mr2639504pgt.546.1639123169858; 
 Thu, 09 Dec 2021 23:59:29 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:29 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 45/77] target/riscv: rvv-1.0: widening integer
 multiply-add instructions
Date: Fri, 10 Dec 2021 15:56:31 +0800
Message-Id: <20211210075704.23951-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:40 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a3f1101cd6..7548b71efd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -474,9 +474,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
-- 
2.31.1


