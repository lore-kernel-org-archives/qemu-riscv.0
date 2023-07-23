Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B44C001DE
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 22:59:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNi2q-0006iy-CZ; Sun, 23 Jul 2023 18:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNi2o-0006iC-D1; Sun, 23 Jul 2023 18:59:18 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNi2n-0000gE-05; Sun, 23 Jul 2023 18:59:18 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-768197bad1cso420037385a.1; 
 Sun, 23 Jul 2023 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690153155; x=1690757955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+8+0Gw4rKQPu8P1gr+WWxhpX/fLUOml+jB5KRSM03M=;
 b=fkFp6lA9rg/7NxqyTGYna72bmwImejH8o6jWcCpsUsjrQPl+tAa8tHnW3UN6Zlotqo
 QBxjhz8lTEXo84bJI0Lp13QNhmLx98aV4Lcdehbl8b+CB8vLg5Vl+0ckGhBxL71cwIyg
 d5gnRTTJhateZfPzzeLZuMLhbWQQgrWd/VIdpqEg792Yw+rLBSMK1hHbrNqUFv9saea/
 PXWli7Q1s48zMpuUxFDJpMNB0IHY/Z2im8LtzBgWONuZBWXFhkJW+GnGJaOntOKSTnyq
 HOqh9EAb7GdLyJPySEXe4qI/GzdFtcC5nw8Q2bh7bG/7FLBNrxEFsPz7VRFDhJWcy9m/
 e2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690153155; x=1690757955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+8+0Gw4rKQPu8P1gr+WWxhpX/fLUOml+jB5KRSM03M=;
 b=LiGBvVzeskBVy+wEBkTkJ/woto1br09SZA3Ve7DS9vGR8DZs0VrBNFBlBunLD1USwL
 7aOIeDHqa+eX1L09PT7F21Jbn4rEz5LmZhAmn3w8bM1FIZ3vulGLzeiAhNlFpaLVimFb
 ovvrOsivXzwX6i/p1PmBhcd6ykptesvo6Zp0pNQ/cmmDzwd0IbHJ4T+CL7wjKPMZXwXH
 sdhlrbsBAbkzBX8nB1hw2WVfJu/RagcYjzGewcXgKeFDZXT36IqPY6CJ6PDBOPj7Z/Zp
 BVfP5j9a4EgnL7u6XK0ElUlzyAyyd8BwS8P2VpKsCKllZ4dBxhINUj56DXCKmoP2D8/l
 4cNA==
X-Gm-Message-State: ABy/qLYF87IjULChMrNFkXZfzmG/B8gSu6EHSKDRxkSC97QZKxAauA+U
 XSO18LKgkBGY9Dk1HD2f2LCEECHn0b39fldVGyE=
X-Google-Smtp-Source: APBJJlFf+pagNDD3NJyBLiR/ngga5KyeFV4aebOd7fkBDlV3PWGwtVOP8igESF4gcyWqjlVRmlXs6ZzXZL+T80AV0kU=
X-Received: by 2002:a05:620a:288e:b0:765:a9d7:2ca2 with SMTP id
 j14-20020a05620a288e00b00765a9d72ca2mr7163016qkp.48.1690153155419; Sun, 23
 Jul 2023 15:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230721094720.902454-1-thuth@redhat.com>
In-Reply-To: <20230721094720.902454-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 08:58:49 +1000
Message-ID: <CAKmqyKNoztDMaKHyGX8UnBDpufpL2zywNo8spYqqBneHAy9BKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: Fix the console of the Spike machine on big
 endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jul 21, 2023 at 7:48=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> The tests/avocado/riscv_opensbi.py avocado test is currently failing
> on big endian hosts since the console of the Spike machine is not
> working there. With two small patches, this can be fixed: First patch
> fixes riscv64, and the second one fixes riscv32.
>
> Thomas Huth (2):
>   hw/char/riscv_htif: Fix printing of console characters on big endian
>     hosts
>   hw/char/riscv_htif: Fix the console syscall on big endian hosts

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/char/riscv_htif.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> --
> 2.39.3
>
>

