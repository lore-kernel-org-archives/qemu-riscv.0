Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYbZx-0003Bf-0W
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 17:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYbZs-0003AZ-E1; Mon, 19 Apr 2021 17:37:08 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:39535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYbZo-000180-NQ; Mon, 19 Apr 2021 17:37:08 -0400
Received: by mail-il1-x12e.google.com with SMTP id b17so30385911ilh.6;
 Mon, 19 Apr 2021 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpI+JiGTmk4A4bIQ2ljfXV2qMoRnxEpWzZ3oTiwfV28=;
 b=DAKpN4Ow2PAWp0CJmI32wBKJLeDEgzDrKiiDclpImyWOVSoOnlbKCffP83bQC/2van
 f7Ca5CkhXweBCJl3hALeGmtxbtgJUbDtXbAYlJ/doFvR4KF4JpGJh2+xM2bWRBl3r5ZJ
 ZOtLYrh/L+04ba05tLp6dnK9mafJmLaNhGQ9Ni5Z+o0CVvpEJ6jjsO4wYfuxcNnj2rCN
 G9KtO+M77BgJ6RQTidSAeq7i26Ec726BQsAcC3qVhYTUmIBu8c+lH/BO26H7SpJ/K3mo
 OAYEhpbwnuDZvmeWf6op2t/HERY2L9DI1UB/+UllluXUBcPB8ULFmL/Jhl2Clspdvpax
 I/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpI+JiGTmk4A4bIQ2ljfXV2qMoRnxEpWzZ3oTiwfV28=;
 b=txZeIKLHFiuAb0825W8WqKu4MOqwbPguiL+1gdTiBCpX2fKFNiTYaGp31MBQU/T8Fk
 Uo4Kf9g0EenRdzLoWNxHdPRLU/9cQvyPV2cF371tdezxuful2Ji3TMNqcNKQO9NL/tDu
 mCDUrIJe4vHwd/c7yv+VAEWe0y8UHNKZZlDUBJNCK0LSwj8MW0lPuUWAZTiP9SEBCpDx
 HAi/Qma5A0pX6i+297OMQoJXLBLBICfQaotpO96fSvwO7icw6GaHS4NvTFwZ6kuS5K1e
 2VGpSBXSJcyd5q6EML4xQO5MqewO4voS4naEe+i5eP03wpxyImLtOOnlOuUBfNfT50dg
 Hi8Q==
X-Gm-Message-State: AOAM532LGAD3W4sHD5ixCDXqfc/Qcf1Gs4nDEI6ktvCCFYkg5Py0WBKj
 m2Mkq0clkEHliHFwZUpM/tW8kPmtIn4kyiqbhAY=
X-Google-Smtp-Source: ABdhPJws3afTL88sIA+pjZZ+DlpFLb40rJwsQo7JLkUOOo3B4qu1TrxWys/GQx1OFQ2STWPN7b4HBRjEW2Xurv0sLp8=
X-Received: by 2002:a92:d90f:: with SMTP id s15mr19127134iln.227.1618868223405; 
 Mon, 19 Apr 2021 14:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <59b1b2ac-dd6a-46aa-9b48-6afa7eb41c0a@ulal.de>
In-Reply-To: <59b1b2ac-dd6a-46aa-9b48-6afa7eb41c0a@ulal.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 07:36:36 +1000
Message-ID: <CAKmqyKMt6i6vA8eGn+fbTH1moQe=Kx_ET_yy2f37PWqyL+mo5Q@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Fix OT IBEX reset vector
To: Alexander Wagner <alexander.wagner@ulal.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Mon, 19 Apr 2021 21:37:12 -0000

On Tue, Apr 20, 2021 at 7:26 AM Alexander Wagner
<alexander.wagner@ulal.de> wrote:
>
> Hi,
>
> I just wanted to check if the patch [1] is missing anything to be
> merged? If so, please let me know.

Thanks for the ping!

You have done everything correctly, I just forgot to apply the patch.

Do you mind re-sending the patch though? When re-sending the patch can
you include all of the reviewed by tags?

Alistair

>
> Regards
>
> Alex
>
>
> [1]
> https://patchew.org/QEMU/20210310221208.167990-1-alexander.wagner@ulal.de/
>
>
>

