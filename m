Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsojP-0000wO-D8
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 10:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jsiqX-0000W8-P6
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 04:20:57 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jsiqW-0007VK-3i
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 04:20:57 -0400
Received: by mail-ot1-x342.google.com with SMTP id 18so33684049otv.6
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2020 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=D3bxmgzus3by+l9bcvRpEv2scWOmFcLH0ZaP5cf2RLA=;
 b=LZ+WBsP77In4I4GZrErCh4UtvOlwqQpLNeoLrGUUZ+NK/egcc/1RGvHe/FLsCg90O5
 hFLSj+6y77/NGSNUSEdy7E2WPrmSEgHpQqpTe7VzK/Q1sxrYdRgqJtAbjxhi3Jw6YFIR
 NlO9kVHnijJ2A5ZWxoKw/eDCFqFYRv6bpUvxI/NnFObm34YZPwHAdfLnohhbt5l8dPHu
 HpJ6ejc46wwMThEgEe1KtWawbWBtdrBx+zcjHrBlh9yPt6lSFIg7koIxbfpcinp8Af5/
 ldLWiV5+BmaYYZtT8BHeIjW5qI8F18PkKacPl4kB3kA1iJjbw948EqVtLKSzFd//MVfa
 4OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=D3bxmgzus3by+l9bcvRpEv2scWOmFcLH0ZaP5cf2RLA=;
 b=My02abGM8tSCJzcAzcopCMyOFkqUbPEG3napS20bEH3bq+OuvlxyJHj/0QrryKVvpj
 hMJoF+f7YpHFV08LdghAoac2AkvAgdUQ/54WvOD+hiTcsrQiS2OjfyeXbo2L3GfL6u2N
 eGNJ24L/LDs7MMCgaeH3Np3KPKOOXSlicTqY4AhoqMpf2crjjf9VC8Yl+hbMh0FdoYS+
 gfObSudnUsiJjdRUwlAn7gn3vRIesdmSGsubTfXAdYeoAxqBqsmDvHrzxbO9UgPRrOJT
 6cy2RQEGaBpBsbdNf/v2blm54EWwalAEambbiDrezlEruuaiVZv7N6JxDKfpz35MayXm
 +mbw==
X-Gm-Message-State: AOAM532AzDpajKwq7ItV1UfxEjiNL+WupgdZNX5a4ZiNyStzHoFbadWb
 pDQM7eFU+6ATPI7kXCEHTCM+7Ax9IYpazcRLtDAUn6fJduk=
X-Google-Smtp-Source: ABdhPJzw1FWPUY8NOJIYBz12wCuf4ayqss7/FAVZeF0U0vNwI8HGPI9+mm4gGLhsUyIK/2ZTwmxmfqYlospe6QBy508=
X-Received: by 2002:a9d:6c56:: with SMTP id g22mr42438487otq.280.1594110054287; 
 Tue, 07 Jul 2020 01:20:54 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Date: Tue, 7 Jul 2020 16:20:17 +0800
Message-ID: <CANkjrB6KFmCAY_F66ZFvVAHjm54sLKStaAz4TUmTGdt=x_N+uw@mail.gmail.com>
Subject: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20` operand.
To: qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000084cc6205a9d5ab2e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=lazyparser@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Jul 2020 10:37:58 -0400
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
X-List-Received-Date: Tue, 07 Jul 2020 08:20:58 -0000

--00000000000084cc6205a9d5ab2e
Content-Type: text/plain; charset="UTF-8"

`imm20` operand type is used in LUI/AUIPC and other instructions.
The value should not be left shifted 12bits for disassembly output.

Signed-off-by: Wei Wu <lazyparser@gmail.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 278d9be924..a2b6472bd8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2083,7 +2083,7 @@ static int32_t operand_imm12(rv_inst inst)

 static int32_t operand_imm20(rv_inst inst)
 {
-    return (((int64_t)inst << 32) >> 44) << 12;
+    return ((int64_t)inst << 32) >> 44;
 }

 static int32_t operand_jimm20(rv_inst inst)
--
2.17.1

--00000000000084cc6205a9d5ab2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">`imm20` operand type is used in LUI/AUIPC and other instru=
ctions.<br>The value should not be left shifted 12bits for disassembly outp=
ut.<br><br>Signed-off-by: Wei Wu &lt;<a href=3D"mailto:lazyparser@gmail.com=
">lazyparser@gmail.com</a>&gt;<br>---<br>=C2=A0disas/riscv.c | 2 +-<br>=C2=
=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/disas/=
riscv.c b/disas/riscv.c<br>index 278d9be924..a2b6472bd8 100644<br>--- a/dis=
as/riscv.c<br>+++ b/disas/riscv.c<br>@@ -2083,7 +2083,7 @@ static int32_t o=
perand_imm12(rv_inst inst)<br><br>=C2=A0static int32_t operand_imm20(rv_ins=
t inst)<br>=C2=A0{<br>- =C2=A0 =C2=A0return (((int64_t)inst &lt;&lt; 32) &g=
t;&gt; 44) &lt;&lt; 12;<br>+ =C2=A0 =C2=A0return ((int64_t)inst &lt;&lt; 32=
) &gt;&gt; 44;<br>=C2=A0}<br><br>=C2=A0static int32_t operand_jimm20(rv_ins=
t inst)<br>--<br>2.17.1<br><br></div>

--00000000000084cc6205a9d5ab2e--

