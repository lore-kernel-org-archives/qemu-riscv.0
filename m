Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDYu-0001bT-Nm
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDYt-0001bG-U8; Wed, 05 Apr 2023 20:33:11 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDYs-0006fn-4h; Wed, 05 Apr 2023 20:33:11 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id dc30so32560733vsb.3;
 Wed, 05 Apr 2023 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680741188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLxE659lpN2kkLFOSrQQzfGrKFWvl7xR3UECsik87dk=;
 b=FaPFnHz+RJgbtgMxlz+9AwMuIKlEsPl4t9+OJlckeQ9lcOtnSThLcnP3aum7SeubNb
 OHrvGvTPb4lAeKOGrKXdUN5dVR7Qqqy/Ea311UmDLv+DbAxCnZ3086zSAXMXq1nHGsNU
 LS7Lu1+0bFXasC10H7QGYQh4BUTzQ9Uqdzn/YTs/7iG5fIDhOHVocJ/kvluGAPKLxtVj
 igIjZqBIEJLLTaOGG0NjtAjDnIp+Wf+8RwiW/BdhG/Vgjzn8Eo4bEbp8XzfcYWC8lz74
 IospF/w6JIPZctBsNnrCyuSrNch3hTSoDYyhbS0AMJPPbMwThCR3AhcNK1cpH2CFj97r
 BrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680741188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLxE659lpN2kkLFOSrQQzfGrKFWvl7xR3UECsik87dk=;
 b=Cwifmm/p8UMQ0wrP35bjErbBQcTo8cNpeaiAgBrg/gCbAQBsFoQzBQKRYdrQVoBJHW
 jO8o2dUofCdAzIa5YqjOFSMbGFLIbtyQbajugb0iBR/XhNp35Tx/nSN++5PSQ8uAmYgO
 oINSPOZzL9o4qzxn3ZFzpLJefvoXH9V/pedOyVnqW1qqsBteEoGRkQteTkyZacfqHe5b
 6PjPuU3cnyLE4+Fn/RpEKKheQow2XnArd3lqpZl+8te6BxXHx1jUC+xLnBjQVG/2GK0/
 myFyqiwPvfjSa27LDV7Xcb79TCNJHcwTML5MAMqsJ6Fgf1JXrOWfvVxDo/H96qQMeimt
 wBUg==
X-Gm-Message-State: AAQBX9ddbdemFxeNNFy+8oKTr4gPJciTT6E50iPLAvaRePGT+aciei6C
 yVVrLiMSeBIieNL3T9NWy/kSoF8IOaXMvMvm8Js=
X-Google-Smtp-Source: AKy350Ziel1LcYaquGWxcHMPyaYx8oBvgqjfm+mJ13OIM16tbUWwiuTnH5K8TRmrqcQKW9RevGsKEVEasYGBcLS8zDY=
X-Received: by 2002:a67:ca90:0:b0:422:1654:7737 with SMTP id
 a16-20020a67ca90000000b0042216547737mr6379982vsl.3.1680741188413; Wed, 05 Apr
 2023 17:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:32:42 +1000
Message-ID: <CAKmqyKOE=mrevVh1CDQtuLWsXQ9VCGDyyavtSbqDievYQhqrHw@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] remove MISA ext_N flags from cpu->cfg,
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:33:12 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version has a new patch (3) that removes the 'multi_letter'
> attribute from isa_ext_data that became redundant after the changes made
> in patch 2. The change was proposed by Weiwei Li in the v2.
>
> All patches but patch 3 are acked.
>
> Changes from v2:
> - patch 3 (new)
>   - remove 'multi_letter' from isa_ext_data
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06493=
.html
>
> Daniel Henrique Barboza (20):
>   target/riscv: sync env->misa_ext* with cpu->cfg in realize()
>   target/riscv: remove MISA properties from isa_edata_arr[]
>   target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
>   target/riscv: introduce riscv_cpu_add_misa_properties()
>   target/riscv: remove cpu->cfg.ext_a
>   target/riscv: remove cpu->cfg.ext_c
>   target/riscv: remove cpu->cfg.ext_d
>   target/riscv: remove cpu->cfg.ext_f
>   target/riscv: remove cpu->cfg.ext_i
>   target/riscv: remove cpu->cfg.ext_e
>   target/riscv: remove cpu->cfg.ext_m
>   target/riscv: remove cpu->cfg.ext_s
>   target/riscv: remove cpu->cfg.ext_u
>   target/riscv: remove cpu->cfg.ext_h
>   target/riscv: remove cpu->cfg.ext_j
>   target/riscv: remove cpu->cfg.ext_v
>   target/riscv: remove riscv_cpu_sync_misa_cfg()
>   target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
>   target/riscv: add RVG and remove cpu->cfg.ext_g
>   target/riscv/cpu.c: redesign register_cpu_props()

Thanks for the cleanup. Do you mind rebasing it on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next then I
will apply it

Alistair

>
>  target/riscv/cpu.c | 386 +++++++++++++++++++++++----------------------
>  target/riscv/cpu.h |  19 +--
>  2 files changed, 202 insertions(+), 203 deletions(-)
>
> --
> 2.39.2
>
>

