Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZDgS-0000aG-Qu
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 10:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lZDgQ-0000a8-Pr
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 10:18:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lZDgK-0008GM-GG
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 10:18:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c4so2641504wrt.8
 for <qemu-riscv@nongnu.org>; Wed, 21 Apr 2021 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6V8UWLrMdS10z8y3GbxzAynh9LOdOm22UuTPekncOE=;
 b=ccJdUi4t230Z2zuUtU1dqKFVfhIIUIQR/wChtmYY9XSnD4KRvPW0h8+xwceWPBnI9j
 VbgawwKTcOOMrlH4xxnELKZdyA5VW/DG7y0kvff7jifb2cFuUdr+mfXf156oYi29Sop6
 VpL5k6/j57q2WGD64k2rYADIPnlVkyJqaoehAMPcBUhbF9pDHmcyJMd9UpmNFK3hWwfV
 27rvV3dJY9XGVIV38OVSHOP4g+t9VqD9PoIML9ggRgUED6ev5VNc+m7NSyK/TVze00Xj
 6+itvRjw0V+zxwqY0P4Py1D/63etl6gmMfRkqjoa6D0FO3wO1FkaOPu9pA0W5Jkr7eNa
 6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6V8UWLrMdS10z8y3GbxzAynh9LOdOm22UuTPekncOE=;
 b=s/lZPUrEW4ubhwzw/Nl31ISyFL5srT+NKbKEyGPzIXWgZ9jviL1Wo4pvzLUJvOqmaf
 biNhuAYyqpwItJrVN4l2C2k6+74ZPuBItUFSai8m42JgpLtT9sUR1Qnjcao/YO5MF8Tn
 yJ0NH3zEdi7Ut0YRx9bUxSeJ1yGDhE1ro5QahGC+MH+MqBgbtEnxYaCLsMXTABXC1LIk
 AWPXzt7DwDL8RS5RUAApVcrmIlIKS+x0or0/HlnOV2JkuXQYK0IQFF4tnzeBDlP5DDYj
 JIixLXkwacZPwfxycNydvv1hk9v9KczfGulqwUlYaHVBTdhBKEiLISrbeNDZjWvoxIBD
 Rn0w==
X-Gm-Message-State: AOAM532HZRZC21hsbiaG24U2JeVDb7zFyDBt+a9CsipSUZtYQqllgnzX
 iNfx0T5WcdoWR/N+0sqdLFI75CmQK+GBpA==
X-Google-Smtp-Source: ABdhPJx5b3z+ay9WdGqj6b0oxjozWRj7EUCh1qrxq7XW796WUJMFPt/D6J9HlVNEuMaN7XC4S6P6vw==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr27258517wrr.374.1619014698182; 
 Wed, 21 Apr 2021 07:18:18 -0700 (PDT)
Received: from [192.168.83.45] (lfbn-tln-1-134-231.w90-119.abo.wanadoo.fr.
 [90.119.102.231])
 by smtp.gmail.com with ESMTPSA id h10sm3289526wrt.40.2021.04.21.07.18.17
 for <qemu-riscv@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Apr 2021 07:18:17 -0700 (PDT)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Subject: [RFC] target/riscv: generated RISCV isa string and subset naming
 convention
Date: Wed, 21 Apr 2021 16:18:16 +0200
X-Mailer: MailMate (1.14r5757)
Message-ID: <1CD35845-3055-45D2-9166-489C2B74E0E7@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 21 Apr 2021 14:18:27 -0000

The riscv_isa_string function deals with all the misa bits the same way.
However, it seems froom the specification that bits should not be =

equally
represented in the isa string.

For example:

- user mode ISA extension does not seem to be part of the isa string, =

only N
   (user mode interrupt) does.
- S/H/X/Z extensions should be suffixed with an alphabetical name.

Moreover the table 27.1 documents a canonical order that is slightly
different from the one initially implemented.

Should we simplify this string?
This string is used to generate the DTB riscv,isa compatible string.

ref: The RISC-V Instruction Set Manual Volume I: Unprivileged ISA,
Subset Naming Convention section 27.11
https://github.com/riscv/riscv-isa-manual/releases/download/draft-2021040=
2-1271737/riscv-spec.pdf


---
  target/riscv/cpu.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b6..4eadd9b9fc1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -32,7 +32,7 @@

  /* RISC-V CPU definitions */

-static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
+static const char riscv_exts[] =3D "IEMAFDQLCBKJTPVN";

  const char * const riscv_int_regnames[] =3D {
    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   =

"x6/t1",
@@ -641,7 +641,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
      const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) + 1;
      char *isa_str =3D g_new(char, maxlen);
      char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", =

TARGET_LONG_BITS);
-    for (i =3D 0; i < sizeof(riscv_exts); i++) {
+    for (i =3D 0; i < sizeof(riscv_exts)-1; i++) {
          if (cpu->env.misa & RV(riscv_exts[i])) {
              *p++ =3D qemu_tolower(riscv_exts[i]);
          }
--
2.31.1

