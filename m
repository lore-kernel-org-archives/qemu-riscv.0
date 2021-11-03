Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi9HU-0006pA-Ne
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9HU-0006oy-4p; Wed, 03 Nov 2021 01:57:52 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:37621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9HS-00031A-7g; Wed, 03 Nov 2021 01:57:51 -0400
Received: by mail-io1-xd2d.google.com with SMTP id y73so1478454iof.4;
 Tue, 02 Nov 2021 22:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7WT1dpnR0LtwxlhmKf42mmd6qGRJl+KkD3DIFC1BluM=;
 b=oivBAuSnTPmnmZNSr5GGwGvJtia/wMT7Dv8P5tKAU0TZelk5h7YEh+QS+gPEJ+4Qgk
 Otu+84xEUTF1C6XjA5VQuyIVP7AMx7vR36abYTvY8NWwchOwI3Wr7H3ETqpR2tZziGoA
 hotXA3XSqBX7wrT/wPJr3K97iwlNfywoaWwsa6PRtnTW9Hfm/H2WSRTw/wKPmDo2F2F6
 NUgsZJRLU4Cyj8WtmQXMsfbheHuuvoEwyzyvSt7SQN6oUqsMLrZ4ZTBBVFPACg/RmaF+
 nLB/LbnJgd78mUfxc2HN7QbgiPiysF/Ynwrk1Jxqllve7oLYgDMiztUyA/KloZidmWDm
 BVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WT1dpnR0LtwxlhmKf42mmd6qGRJl+KkD3DIFC1BluM=;
 b=VoobGdT2OCQVSq3WqTah2ArhO2Fx+1iVxYvse6zxKBpjPp5uKzCynHx/HJLSfyzkOL
 3okMaMSRk+bdba+k9r+uJtxY4THI8RgojHNxXOY8UJVrcpBEqKdoklAYVv1Ck92eco9X
 biJ3ccrpDGiELmf1jujCSon6AZtUHG9M2/MxoyK0NUsFeO454u4iJ4ne4+/76aPlGsue
 nir0PfIf0WK69SDEeYX9rg1fAzLC7NwLNF0zlRd6GTsOZYi5BSJgWQ6p8WJ07CQ+5PWN
 zAftucYdQuOPSNefpgQ7uUoKvtDKp8J2WjG7fX7gFFZ0HwH0fQjNvVVYh/78qDqPgoxi
 Kc1Q==
X-Gm-Message-State: AOAM530Cx9W/jTf3s4gGaq0apNmejrodMmfFH3ZibB5DPGTAFczezKv2
 wLYSMuoGG9N2X9FCnDG8eixiyLqwLjuuTH/E3Ck=
X-Google-Smtp-Source: ABdhPJxitD127EVXYOLXGVpOyyg/x6CMYCHfhpPjQf2mbBXYiAuXtWuxbyAfmxWsnnbZ6d/fojQUqZ7/7qiGLY/i+44=
X-Received: by 2002:a5e:890e:: with SMTP id k14mr28061842ioj.187.1635919068753; 
 Tue, 02 Nov 2021 22:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-8-anup.patel@wdc.com>
 <CAKmqyKOyTR1RX4k3Eq-YmcuWRsxVu5J=o-_eQeU6Ht1TUEUEBA@mail.gmail.com>
 <CAAhSdy2F+63j3S1zP=eQMaeM4dpRvNLO55avAaZgZXO5ZpTbPw@mail.gmail.com>
In-Reply-To: <CAAhSdy2F+63j3S1zP=eQMaeM4dpRvNLO55avAaZgZXO5ZpTbPw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 15:57:22 +1000
Message-ID: <CAKmqyKPuidjDRi79DEWDHzN9Rh4q5-HkVzEpTi=C+aQLpmH8aQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/22] target/riscv: Add defines for AIA CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 05:57:52 -0000

On Mon, Nov 1, 2021 at 5:57 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Nov 1, 2021 at 12:26 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Oct 26, 2021 at 5:01 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > The RISC-V AIA specification extends RISC-V local interrupts and
> > > introduces new CSRs. This patch adds defines for the new AIA CSRs.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >
> > What's the status of these CSR addresses being finalised?
>
> These CSR addresses have not changed since the past 2 months.
>
> Overall, the AIA spec has been in stable state for quite some time
> without much changes or objections.

Let's at least get a CSR address request submitted so we can start to
finalise on the addresses.

Alistair

>
> Regards,
> Anup
>
> >
> > Alistair

