Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWyIq-0002NB-Ua
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 04:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIk-0002KO-NX; Mon, 26 Oct 2020 04:56:28 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIh-0005mM-7n; Mon, 26 Oct 2020 04:56:26 -0400
Received: by mail-yb1-xb44.google.com with SMTP id a12so6990620ybg.9;
 Mon, 26 Oct 2020 01:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FfLOAjahncpkasQDDGDvZM/uLsegQerJKNZCielFNfY=;
 b=J0hRADVocArcCo61AV3MvcXIBzTSHjuxEifrKz9bMphIn3u5e0gFGHlXQM5XosOgD7
 ZDyCBn6Ih7oA2IgrfUAtFd9V+YZkN9UK9qVTsZOSaZupc3nzj4RGiI101UU0GeCGvplj
 aR21TArpix7ZnnDVua9SFU30eiFSFf0dlvreG41leefEdMoNS4khtd5duaN9ImT9eDOF
 Mo7Hd5+XDRUk6ddJyt7z3anJB+ri9zAhB32S72a/z6qxM3/XOTwHIpUJEMncNnPosQaL
 7bxYkw2LNDrTPfj0OYfcFXbw/xVF8DsQRbh+A/fPGyx5FRch/vCt9W3/HKqmpHWbxly7
 2DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfLOAjahncpkasQDDGDvZM/uLsegQerJKNZCielFNfY=;
 b=tBkIB649r+6DeNpciIdIUbz84LLwIi/Vutkq1IC+LgiiT13FEVf4UDFm4kl9tumK7M
 3YYEh27v3DMu4Ypf/Xusg/3YoxNBWWPBf0Kzx+AA/w9mxvgoKbabYCZmwgLOsuWdy2P8
 tH3EzNASH4DPQM/9jw2ETVjMDPOOj9fHsBUWumK0G4iv3MAD+ElcT3RlyYDD6nO1B7V7
 1OXWhJUeHCT5u0d+yQgllv+Pex2kcXqUMBU9slJl6qeOJGXnGtlSBwe224T1gJgdaMAo
 J5+Co2xX/LEMKtmXnPaHEh+NFdRC2nLzaReegn01F2Ho4xSfI3Ih5DEF93Vlu8wUkr/M
 SxVw==
X-Gm-Message-State: AOAM530QWDDBd0LFhCSU44ZfZ4Q/2iHcmV1g3O65RYcFAra9ca1tduIG
 jMOG5K2hA7A62hfuv8ZT7WKSGxNgHPFW7ThBick=
X-Google-Smtp-Source: ABdhPJzBoHZP7ifCxxny1hM+9EEXe2FrFvxMZ7kguuHD6dyv+9ELYhYnbk2Yqi1MuvvKwXyo7+Det0RP0dlYUnOBRDI=
X-Received: by 2002:a25:f81e:: with SMTP id u30mr21674516ybd.332.1603702581983; 
 Mon, 26 Oct 2020 01:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <6adfabd1e61f13932b99d7a9f6839a5c87ad8ce7.1603467169.git.alistair.francis@wdc.com>
In-Reply-To: <6adfabd1e61f13932b99d7a9f6839a5c87ad8ce7.1603467169.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Oct 2020 16:56:10 +0800
Message-ID: <CAEUhbmW-zXeH4Ldo1HYtmDH-fYt_aik_4iXQHxzn_+9jMzWYmQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/16] target/riscv: Add a riscv_cpu_is_32bit() helper
 function
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 26 Oct 2020 08:56:31 -0000

On Fri, Oct 23, 2020 at 11:45 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 2 ++
>  target/riscv/cpu.c | 9 +++++++++
>  2 files changed, 11 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

