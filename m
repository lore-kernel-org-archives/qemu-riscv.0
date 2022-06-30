Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6nVS-0000UN-N4
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jun 2022 02:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1o6nVQ-0000PX-Cg
 for qemu-riscv@nongnu.org; Thu, 30 Jun 2022 02:18:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1o6nVH-00016t-Ub
 for qemu-riscv@nongnu.org; Thu, 30 Jun 2022 02:18:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v9so10058399wrp.7
 for <qemu-riscv@nongnu.org>; Wed, 29 Jun 2022 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7xM3OhE+t7tN4aI29+ux8cGB8TqHHI1AqNvnM/g4Iw=;
 b=KHh3G03m82tfwHCqyRAatA6FqopG6HeUF27wl5BzwLlBPQN3SmPX3Sm20Zv6deV7ML
 Ig+GZ+GxwSD3+FJ8SizoIL9T2JuwkgTi6QaAQPxVqrDj2wHl8BaXZVingUf3zSGhnC0I
 pxl0ljbPlNNUnMk2ii5PimXaVhk1NROCrIUVrwIK4usY61AnnzWWusZ6SsN4sLuhG0W2
 39ybYL/xCtmG7J1q4cH6awDz/x3bRopKa+CTt5NVUg9mNER+aCJNSOtV78fpCBPHodf5
 Pz/pMIJZWq/nNdCvf8yrtr1HhJ7kv1nv13YIJ/outWMhoQ1Jx8o1ZXMriCsmy10Bl5Eq
 zhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7xM3OhE+t7tN4aI29+ux8cGB8TqHHI1AqNvnM/g4Iw=;
 b=O9Z/Y1f5uhSUAAk123uqc/Cn3OiuRKJ3LGMtub5hpa+QFk2xjcAIYyuSeRKrlmcEa1
 erRlwaPuqVA+CkTjW8zbVjxj5hhwbEEHPpsdQq2q+CRNsll2PkCO4DPeo/rfr2JezDz0
 cU9dllCO/nC6dx+nNhPJzRqyaB7DP7Suf/DkV8+ZA6RtPPKVbR8t2gwOWiwYZ7Y84LCM
 3yQvuVcJY+jhZbyQuSVO1kkC5D7a2UIAw/QNQ4m0Dk7WV23GwEplKAgGsnx4uA0ImC1M
 9u7TD60UjRRDXD5ZmM+LkJy0UiqsycE7ECyp4q3xg4RNpGMrhxIyjny8hw7PDydFExWc
 bmZA==
X-Gm-Message-State: AJIora8P9Q44vZMuP9lKbxqE5A68VXMX/c5PfQY7T4TxSJgyFmmBDxnC
 cuzXZI4+fgjsd8M1ShqhwCyinwcAekzXrt7NcCzYbg==
X-Google-Smtp-Source: AGRyM1tLhu2yWSQo7PtcDy0OCeISMzvfDtF6t4bNTXVAIRWnDhArCthkmEUuP0ZhSSa3GbLE2kDEhYVS9nAC0XEloFY=
X-Received: by 2002:adf:e402:0:b0:21b:a5ea:593f with SMTP id
 g2-20020adfe402000000b0021ba5ea593fmr6644283wrm.313.1656569893570; Wed, 29
 Jun 2022 23:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220630061150.905174-1-apatel@ventanamicro.com>
In-Reply-To: <20220630061150.905174-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jun 2022 11:47:21 +0530
Message-ID: <CAAhSdy2iTPwqzUAhV8s97k1d4sK-bne1z-T6pg__p3xfsUrdHg@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] QEMU RISC-V nested virtualization fixes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jun 2022 06:18:25 -0000

On Thu, Jun 30, 2022 at 11:42 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series does fixes and improvements to have nested virtualization
> on QEMU RISC-V.
>
> These patches can also be found in riscv_nested_fixes_v9 branch at:
> https://github.com/avpatel/qemu.git
>
> The RISC-V nested virtualization was tested on QEMU RISC-V using
> Xvisor RISC-V which has required hypervisor support to run another
> hypervisor as Guest/VM.

Changes since v8:
 - Drop first two patches because Alistair has already taken care of it.
 - Include instruction immediate offset in "Addr. Offset" for PATCH1

Regards,
Anup

>
> Changes since v7:
>  - Improve tinst "Addr. Offset" in PATCH3
>
> Changes since v6:
>  - Droppred original PATCH1 and PATCH2 since these are already merged
>  - Added PATCH1 to revert dummy mcountinhibit CSR
>  - Added PATCH2 to fix minimum priv spec version for mcountinhibit CSR
>  - Fixed checkpatch error in PATCH3
>  - Fixed compile error in PATCH4
>
> Changes since v5:
>  - Correctly set "Addr. Offset" for misaligned load/store traps in PATCH3
>  - Use offsetof() instead of pointer in PATCH4
>
> Changes since v4:
>  - Updated commit description in PATCH1, PATCH2, and PATCH4
>  - Use "const" for local array in PATCH5
>
> Changes since v3:
>  - Updated PATCH3 to set special pseudoinstructions in htinst for
>    guest page faults which result due to VS-stage page table walks
>  - Updated warning message in PATCH4
>
> Changes since v2:
>  - Dropped the patch which are already in Alistair's next branch
>  - Set "Addr. Offset" in the transformed instruction for PATCH3
>  - Print warning in riscv_cpu_realize() if we are disabling an
>    extension due to privilege spec verions mismatch for PATCH4
>
> Changes since v1:
>  - Set write_gva to env->two_stage_lookup which ensures that for
>    HS-mode to HS-mode trap write_gva is true only for HLV/HSV
>    instructions
>  - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
>    patches in this series for easy review
>  - Re-worked PATCH7 to force disable extensions if required
>    priv spec version is not staisfied
>  - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine
>
> Anup Patel (2):
>   target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
>   target/riscv: Force disable extensions if priv spec version does not
>     match
>
>  target/riscv/cpu.c        | 150 ++++++++++++++---------
>  target/riscv/cpu.h        |   5 +
>  target/riscv/cpu_helper.c | 252 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/instmap.h    |  45 +++++++
>  4 files changed, 390 insertions(+), 62 deletions(-)
>
> --
> 2.34.1
>

