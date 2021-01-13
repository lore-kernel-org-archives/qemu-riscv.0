Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjtN-0008E0-UH
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtL-0008BM-Gq; Wed, 13 Jan 2021 12:25:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtI-0005wj-3P; Wed, 13 Jan 2021 12:25:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id e25so2346147wme.0;
 Wed, 13 Jan 2021 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qM+WMPm9+Hjt/UIhL77XA+4VCNDq6a3MUy1J9umBvsc=;
 b=VbbfHn04l2rBSxh0AvYQkbS7S1MJjdzqudjakpJcWpUI4z5K/c/liCeC9UgV9YhQTO
 Ci9dmAdy+ytRTTz77zCEXSkSlf2qc3/NiiJLE2GDkFZesVkA1TS/LneBEbMoqjpy9j68
 gDO9lL2Sr3V15p74uKh1aSzvmlAm7kcEWbQeRSnOSmnyJXMXAqSkCR91ExwuOjlCZaY1
 29vxKh6sypY6lhlB/oRY8pKBuRKPHqU8beBTaCupUL0fvcdFffTtu5Y8YOqwB0I1mwTi
 aRDvsIdaumHSzD7zqZgNUSnlrQVxwHdtTTmEFDURAS9ZkBacWLyPTiQukq9MIrqaaguS
 RUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qM+WMPm9+Hjt/UIhL77XA+4VCNDq6a3MUy1J9umBvsc=;
 b=MaMgIyxvMX7gql7MCgxhTQnededmpTgRWy+UWJIznJAZWqoMc0Ectp5DiSk02AvsWk
 6HEPmxvxVxP/x4nuO1HgADqgDjdXbK4/pUnlyHq22zsk6dWyjueTVwRO4q45bRbfLFvn
 /1a87pCKJoa0yLKuZgzD0TsFpQjF2nT3w3fNNlkIrIcOLG7602vkqQ20ppRMF5hkWXyy
 Rk2HBfMAVXTumMWnK+K2/VTvSqO/u08SR41wfE8/yBvahJ17mJRkY5Vofa3+inGQDMcZ
 zaaDLx47pBZZMxbMVZhy2RY3TUHmYAge7ADJqBE2eG/rCnVP6WMGn+c1/N7ajhie/9Yw
 W0bQ==
X-Gm-Message-State: AOAM531o/gVfRtn7Oofx/dAFFouDfgvqlujjWmLp+q79ZkeJmrQ8zM4i
 t2rrhVfI5ZAA29Me5E3TEY9Dk7Qw2Y4=
X-Google-Smtp-Source: ABdhPJxvPNroUj8J29oimpPGSHpcBrCJcMGNJSlXTSGoUsLb21UGp/HoRlHppZds10roUK4YRDcCQQ==
X-Received: by 2002:a1c:8181:: with SMTP id c123mr286452wmd.23.1610558701509; 
 Wed, 13 Jan 2021 09:25:01 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h9sm4030774wre.24.2021.01.13.09.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:00 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/6] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
Date: Wed, 13 Jan 2021 18:24:53 +0100
Message-Id: <20210113172459.2481060-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 13 Jan 2021 17:25:08 -0000

Since v1:=0D
- Redo the whole change, only hoisting when variable is used 10+ times=0D
- Remove goto statement/label=0D
- Take care of the following pattern:=0D
=0D
    case INDEX_op_bswap64_i64:=0D
        a2 =3D3D TCG_REG_R0;=0D
        if (a0 =3D3D=3D3D a1) {=0D
            a0 =3D3D TCG_REG_R0;=0D
            a2 =3D3D a1;=0D
        }=0D
        ...=0D
        if (a0 =3D3D=3D3D 0) {=0D
            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);=0D
                                         ^^^^ take original a[0]=0D
        }=0D
=0D
Attempt to fix the warning reported by Miroslav using GCC 10:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html=0D
=0D
Diff with v1:=0D
=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/6:[0063] [FC] 'tcg/arm: Hoist common argument loads in tcg_out_op()'=0D
002/6:[down] 'tcg/arm: Replace goto statement by fall through comment'=0D
003/6:[0190] [FC] 'tcg/ppc: Hoist common argument loads in tcg_out_op()'=0D
004/6:[0136] [FC] 'tcg/s390: Hoist common argument loads in tcg_out_op()'=0D
005/6:[----] [--] 'tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS =
el=3D=0D
ements'=0D
006/6:[----] [--] 'tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_A=
RG=3D=0D
S elements'=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (6):=0D
  tcg/arm: Hoist common argument loads in tcg_out_op()=0D
  tcg/arm: Replace goto statement by fall through comment=0D
  tcg/ppc: Hoist common argument loads in tcg_out_op()=0D
  tcg/s390: Hoist common argument loads in tcg_out_op()=0D
  tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements=0D
  tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements=0D
=0D
 tcg/tcg.c                    |  19 +--=0D
 tcg/aarch64/tcg-target.c.inc |   3 +-=0D
 tcg/arm/tcg-target.c.inc     | 196 +++++++++++++++----------------=0D
 tcg/i386/tcg-target.c.inc    |   6 +-=0D
 tcg/mips/tcg-target.c.inc    |   3 +-=0D
 tcg/ppc/tcg-target.c.inc     | 191 ++++++++++++++----------------=0D
 tcg/riscv/tcg-target.c.inc   |   3 +-=0D
 tcg/s390/tcg-target.c.inc    | 222 +++++++++++++++++------------------=0D
 tcg/tci/tcg-target.c.inc     |   5 +-=0D
 9 files changed, 311 insertions(+), 337 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

