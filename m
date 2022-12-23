Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8e5S-0006ZN-72
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 04:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8e52-0006I1-0Y; Fri, 23 Dec 2022 04:11:15 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8e4x-0005Cv-Op; Fri, 23 Dec 2022 04:11:03 -0500
Received: by mail-lf1-x130.google.com with SMTP id z26so6326253lfu.8;
 Fri, 23 Dec 2022 01:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WArzETO1zCDLeZamoOyDp0QDTiEFlTpwo/zfWc9wOOQ=;
 b=EGgkSQxH/McnuVEH7XkOtlM7c8Nw6XvlrgfAfxUCINqPj1tO54XuBb0bJVypiJ9sao
 qiZ1mCP1ajv8NEuxuv4iJC1FQAjwRB28i4MDP4kMnO9vzEdev0y51W1ThVI7eKeU7v9t
 GAZCFa47y+EuPa9QBA2JOWpO1eIepibDBS2MK8omPCn7bFjEv4znsJYe9SAI3Vpvt/k/
 61A6QV30ZZ+l+G3UJ3Ncm8dBhzpBKTmqNNaYXOKZlvDalbnusi3W2W6IEB0Y3WT+A/7C
 YVuV9J/mk0Abc0oDhMP3+4fJ4f7H3Wm1N/JaOa7R9CMKYWrgeKoTRU2qLBdCFQYb4wcV
 MAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WArzETO1zCDLeZamoOyDp0QDTiEFlTpwo/zfWc9wOOQ=;
 b=PK1EvzxPgKcl9m+CGq5kVPdJludXciLj/9XjynBsH3RNdSw/NKdlyoCYsEF2h9NrTt
 3FtiiBoXyzLd7mhkauFMG1xElNXm/8F7SPz9FtnBeD4GDEU4EjRzlcMG+eP8SOoNw2mN
 j9f/hL7U/ubp35Rogy/fMOpp9YvKbPCc4Ap2RJFYJd2jC7/CKpqmVCzCkHlC116/Ixx8
 0biIzJi8qEDoL3UoGRbekjxLGRw8q+s62hzuKXnuALPWAY8XPTjU+M29u5XD2buKRyMo
 aVPQzRwMOxVr0xLcF/vh0dl9tDadh47aItNWVlfPDbkp3dCKRdd7wZnUqz8H3a938UCO
 EppQ==
X-Gm-Message-State: AFqh2koIYKi4AzOtchT4NAFTCwSvIHe/OObxhDFKTfWiagF63qKwUk01
 VS4CMBBCcNA4N2O4TDzCuTFXCRDuwpALKE2135Iwar/EY6c=
X-Google-Smtp-Source: AMrXdXty6v36d9cZEnUMBQi3DiKKVeYBJ8p0XZjK3qolL7H+T5GambyXcOhmdWeuldSwQPGkvIfeC+tv62rEka8dohA=
X-Received: by 2002:a19:4f54:0:b0:4b5:853b:e475 with SMTP id
 a20-20020a194f54000000b004b5853be475mr442002lfk.197.1671786656881; Fri, 23
 Dec 2022 01:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-4-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-4-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 17:10:46 +0800
Message-ID: <CAEUhbmWHpwiekAEMO8XOT3Chq96xcfj0BXxqEw8YFdGCSx3+UA@mail.gmail.com>
Subject: Re: [PATCH 03/15] hw/riscv/sifive_u: use 'fdt' from MachineState
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Dec 2022 09:11:28 -0000

On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The MachineState object provides a 'fdt' pointer that is already being
> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
> command.
>
> Remove the 'fdt' pointer from SiFiveUState and use MachineState::fdt
> instead.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/sifive_u.c         | 15 ++++++---------
>  include/hw/riscv/sifive_u.h |  3 ---
>  2 files changed, 6 insertions(+), 12 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

