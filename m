Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNDa-0002F2-ER
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNDY-0002B0-G6; Fri, 30 Apr 2021 03:05:40 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNDW-0004Yv-S4; Fri, 30 Apr 2021 03:05:40 -0400
Received: by mail-ej1-x62e.google.com with SMTP id t4so20391915ejo.0;
 Fri, 30 Apr 2021 00:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LPdx+jF0CLWeUsQ3inDtRtcpQVPPegXbGAOTsItkSTY=;
 b=S/AFQ0e9PcXbBAy7d+XacLvh1mDmf6shCQ0nOJJNjzLfnClpe7qQgqLuJERARpuXsk
 jwsRTHh0Fp/jTF7JPQVF5Ts6zurC+0PE+Gnoe3lkb/NsE4uwU45iiqoYeglDyule3EuZ
 kFVNznLqaAXUsBh6IlJ0drK5kmXnUWNgHbjrmRXO7NJ5nKr39AiDLx/oEJnX3EuUKOkZ
 AmI7di6f4xcR44/+MbPlYGB1641iWaEbxPNRWcJmzuVxSwJM/yBNM73wzaAXEKyJLb1h
 KzsPQIu7T+4zwFRvqsO8EYXb/OiH0HF0ePaI1tW+AyHB73jFGGf6EnTEC2ZbzE+tGFwg
 3+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LPdx+jF0CLWeUsQ3inDtRtcpQVPPegXbGAOTsItkSTY=;
 b=ozJBjWWzXzxlsbUqrm76AptwopSdhZX0cC8WjCv8mTLboRGM6NtH0XgG+4YxkGImJA
 uXdQSjkNZrX3lBoB4b7+hGxUqfJIdj0ngeDieiSks+7SmmGJ3TUeUMq1cRnE+T5mWxrR
 5WkOWIwT7CH4GCHUQhIDhTGCw3UdT5xpxqSg8kwyi/OKBH3VBhhm8POJ140x5k8zGReX
 tV8lDXpDPt1/eXJTyUkja2Km0ZKaS4VzhLWjZV14vqOhIfohAE9CTGHdNLN66H0ZHY+k
 HfNVwPNQbpVeVTp3cME4vB9HXqsvaqlEkFpKAGC2+7Q4i+GoNlqCySO/oICk2E7q0J2d
 9Qow==
X-Gm-Message-State: AOAM532luyrAxJuvG86BnCVywn+EeDGQgRi6F5cEkjqIjs1c5XSM1utW
 3Eb8Zeg4jenIrw3daKEzo40=
X-Google-Smtp-Source: ABdhPJxqU56/A3NDtzY10R8IeNCTh/k/9BHHKWKrQ3kC3gHCblS/NrFBNWvtOI8GYHH2wlsvCCkTZA==
X-Received: by 2002:a17:906:90d4:: with SMTP id
 v20mr2669274ejw.275.1619766336518; 
 Fri, 30 Apr 2021 00:05:36 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t15sm578532edr.55.2021.04.30.00.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:05:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] docs/system: riscv: Include shakti_c machine documentation
Date: Fri, 30 Apr 2021 15:05:34 +0800
Message-Id: <20210430070534.1487242-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 30 Apr 2021 07:05:41 -0000

shakti_c machine documentation was missed in the riscv target doc.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/system/target-riscv.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 8d5946fbbb..4b3c78382c 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -67,6 +67,7 @@ undocumented; you can get a complete list by running
    :maxdepth: 1
 
    riscv/microchip-icicle-kit
+   riscv/shakti-c
    riscv/sifive_u
 
 RISC-V CPU features
-- 
2.25.1


