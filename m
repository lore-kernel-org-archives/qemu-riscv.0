Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFTMH-00032x-R3
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 00:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFTMF-00032d-Nz; Wed, 11 Jan 2023 00:09:03 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFTMC-0005Nr-RV; Wed, 11 Jan 2023 00:09:03 -0500
Received: by mail-vs1-xe31.google.com with SMTP id i188so14560288vsi.8;
 Tue, 10 Jan 2023 21:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8vXPskM2ebDQ2tTBSX6dL1zGtpVnNhnGjz9N4spL2nI=;
 b=JUfUf7eQaeH2LMVhH9V1r+1dH0kFjcKDMKeeawTJfAjxvjEQy/PnNatZ2+hjQ5WFwI
 3n0OUevLssVShiJkZjj7Mf++bt3R1G02wbC18vSBenYLmlI3L4Kw1nYaDDHnt4USeJ9D
 9sKDEV57tajBhXrsEjDVls81xuUnpTyyH8+rIckAR2xLQ6NIVGar9QxqIxLzts8GmZEH
 xhekQuwVDHusK5SuIiaKDxRWS3rkJaU8jHcHCCPq1QFJOAbYTE5pKBzmwJYcqtyqD6cs
 rnNVcdCLgTndJ3mXEHgwhbOxqb00jjSg0r8ElwO9BMc8fMvYEYS3VmWmt4CLy+LEjKdL
 2VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vXPskM2ebDQ2tTBSX6dL1zGtpVnNhnGjz9N4spL2nI=;
 b=KJFdpDuPnC26jeh0buJCjw0mbxErqKsVWbGBCgDXeWoWGJTyJLxP/bMn5d2Sf/uRKb
 rCZN5JkZ/QJSMIRDLEbXxnUPPbDKDXT3bcsokcXN8GauNMoI2ahJG8h4tRs0Im4GKj+P
 A8ChFS8LSOKygh4QXapZ0r8XqNQqlkfuzO4zXqil+w0ctcIr+tPAtwLGpWe4sjVlNfXg
 AUuIjcCF30KEJ6NwqzDXWmTQ/KFlxrNDcD0Eq7EKEHEd1J2WDtXv5rgxMNKtKz22xC+q
 qe39I4xYVag9UAYvh5ZpreWvE6SfMglow5GI95TYzjlYEZsEJFGLhRo5zXYsSAGYQaxj
 qmVQ==
X-Gm-Message-State: AFqh2krkVUWjfW7mjsFDruISDuLri+9G2YJO/PghLPD5b1G+bQ2JMIgA
 FI4aslJ6tHTAfZ5+ikML8yIsBtujKouKD9Cmfx3v7tSmdXg=
X-Google-Smtp-Source: AMrXdXvFtc+domUmjm6qx5/4G+04C2sKAxpKCNmfV5sYFWeAvNbKupuODicgTYGGUXF0D5m8WlHz/83S28EqJbrn1Uo=
X-Received: by 2002:a05:6102:c4a:b0:3ce:f2da:96a with SMTP id
 y10-20020a0561020c4a00b003cef2da096amr2601318vss.64.1673413739338; Tue, 10
 Jan 2023 21:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 15:08:33 +1000
Message-ID: <CAKmqyKPGq_gthO0VL7HPo=YR5szwyDTjaFVQGQTOk8XpFmHn=Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] riscv: OpenSBI boot test and cleanups
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 05:09:04 -0000

On Mon, Jan 2, 2023 at 9:54 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version is still rebased on top of [1]:
>
> "[PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity"
>
> from Bin Meng.
>
> The change from v4 is on patch 9 where we added an extra flag in
> riscv_load_kernel() to allow for boards that don't load initrd
> (e.g. opentitan and sifive_e) to opt out from loading it altogether.
>
> * Patch without reviews: 9
>
> Changes from v4:
> - patch 9:
>   - added a 'load_init' flag in riscv_load_kernel() to control whether
>     the function should execute riscv_load_initrd() or not
> v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04652.html
>
> Changes from v3:
> - patch 1:
>   - fixed more instances of 'opensbi' and 'Opensbi' to 'OpenSBI'
>   - changed tests order
> - patch 4 (new):
>   - added a g_assert(filename) guard in riscv_load_initrd() and
>     riscv_load_kernel()
> v3 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04491.html
>
> Changes from v2:
> - patch 1:
>   - reduced code repetition with a boot_opensbi() helper
>   - renamed 'opensbi' to 'OpenSBI' in the file header
> - patch 9:
>   - renamed riscv_load_kernel() to riscv_load_kernel_and_initrd()
> v2 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04466.html
>
>
> Changes from v1:
> - patches were rebased with [1]
> - patches 13-15: removed
>   * will be re-sent in a follow-up series
> - patches 4-5: removed since they're picked by Bin in [1]
> - patch 1:
>   - added a 'skip' riscv32 spike test
> v1 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg03860.html
>
>
> Based-on: <20221227064812.1903326-1-bmeng@tinylab.org>
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
>
> [1] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352
>
> Daniel Henrique Barboza (11):
>   tests/avocado: add RISC-V OpenSBI boot test
>   hw/riscv/spike: use 'fdt' from MachineState
>   hw/riscv/sifive_u: use 'fdt' from MachineState
>   hw/riscv/boot.c: exit early if filename is NULL in load functions
>   hw/riscv/spike.c: load initrd right after riscv_load_kernel()
>   hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
>   hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
>   hw/riscv/boot.c: use MachineState in riscv_load_initrd()
>   hw/riscv/boot.c: use MachineState in riscv_load_kernel()
>   hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
>   hw/riscv/boot.c: make riscv_load_initrd() static

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/boot.c                | 91 +++++++++++++++++++++++-----------
>  hw/riscv/microchip_pfsoc.c     | 20 +-------
>  hw/riscv/opentitan.c           |  3 +-
>  hw/riscv/sifive_e.c            |  4 +-
>  hw/riscv/sifive_u.c            | 32 +++---------
>  hw/riscv/spike.c               | 37 ++++----------
>  hw/riscv/virt.c                | 21 +-------
>  include/hw/riscv/boot.h        |  5 +-
>  include/hw/riscv/sifive_u.h    |  3 --
>  include/hw/riscv/spike.h       |  2 -
>  tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++
>  11 files changed, 150 insertions(+), 133 deletions(-)
>  create mode 100644 tests/avocado/riscv_opensbi.py
>
> --
> 2.39.0
>
>

