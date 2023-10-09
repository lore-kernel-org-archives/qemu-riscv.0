Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC5E95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:15:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qperh-00053C-12; Sun, 08 Oct 2023 21:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpere-0004zG-M4; Sun, 08 Oct 2023 21:15:18 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qperd-0000mA-4Y; Sun, 08 Oct 2023 21:15:18 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-579de633419so49466697b3.3; 
 Sun, 08 Oct 2023 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814115; x=1697418915; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlqBKZWtrSTS87BKCgHlEGG1LZ3otUW5S+oUUp6y6ks=;
 b=Cw8hO09qxeXjz0YvaHMiXwODCBYIaF5QQS0Efle0tig4orINZLbY/HVTI2lq1ZTfNe
 5kZP1BlyIFr96DTFCPWHm3ClGQxeloNRdf4RdGc5roAHJDC/aD9HDQleWhBcIVmC16rJ
 IFdkhaYFoUTctF/1SZs+WMmAFTcN2Bof3ymBw4XksQXnk1Dc1QhH/XW0z7s1xMyPMig0
 U3N1g6X6eFQVSXGsSoTNfan9nlSn/3ygnpD0odOA3PVpBxQYCnJJHY9NfMrhqQe8/7sy
 rb+TCwCAGncg/eDU6ot/giMtlFAhdrQvrB4guVp84xqorCdwOWvg8I5mq4KjEriox/T/
 INKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814115; x=1697418915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlqBKZWtrSTS87BKCgHlEGG1LZ3otUW5S+oUUp6y6ks=;
 b=t0ujeKMToFythtMlylwpt8Eu/1hETLDJp6ohatU5f/E/hEacd1pMldlrzYdvcSH6rT
 aebVDCRGyxiNph7noO7iL7diGc+xEECnf6tj7v6ZuKaFV4VShQ3u+v7pnBTcfVj+HopU
 k6j4bvfDGieCZU3vfMHXcAkuzHc6FtlwzEgvf1IU73WvDPwKtOmqJJu/dMLVQ4E1UAcU
 2hc6X2MXorMs2mzmGw1O8qlRBda7+euryey/arp5MqDuY2oDaAV9eOAg7Oh0I/icMCVe
 qcfaSMTuYW7H7vSiUe1/RGq+JGpgnQ0HpzdZrFSPtVbb6gVilEFqThtkyHM3Jku4QCZo
 jE0A==
X-Gm-Message-State: AOJu0YytYMW2oWNjED+1oYe1IkiBt7ju1rl8pn7DbQ/vN1OrjVs/waLy
 L8V0wE5zBa6teZgFRUV52RsUv2egQFNbGuLp5+Y=
X-Google-Smtp-Source: AGHT+IEmymobPY1HuKnoEIDR+NaiRAbY9V0c3amWQQzhQ4sv3uEWS9/xERmwdWrPoYk0HAGnPSdM75zZhFPRDQORca0=
X-Received: by 2002:a0d:ca06:0:b0:59f:5b6d:c9ba with SMTP id
 m6-20020a0dca06000000b0059f5b6dc9bamr14025138ywd.20.1696814115230; Sun, 08
 Oct 2023 18:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231003113259.771539-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231003113259.771539-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:14:48 +1000
Message-ID: <CAKmqyKOBYNp2d7+4qQCojuDMmERTYgYkcacJ+V0sUNrzOMjUPQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv, kvm: support KVM_GET_REG_LIST
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=alistair23@gmail.com; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Oct 3, 2023 at 9:34=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> Starting on Linux 6.6 the QEMU RISC-V KVM driver now supports
> KMV_GET_REG_LIST. This API will make it simpler for the QEMU KVM driver
> to determine whether a KVM reg is present or not.
>
> We'll use this API to fetch ISA_EXT regs during init(). The current
> logic will be put in a legacy() helper and will still be used in case
> the host KVM module does not support get-reg-list.
>
> Patch 1 contains error handling changes in kvm_riscv_init_multiext_cfg()
> where we're using &error_fatal and errno.
>
>
> Daniel Henrique Barboza (2):
>   target/riscv/kvm: improve 'init_multiext_cfg' error msg
>   target/riscv/kvm: support KVM_GET_REG_LIST

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/kvm/kvm-cpu.c | 100 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 5 deletions(-)
>
> --
> 2.41.0
>
>

