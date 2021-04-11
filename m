Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVRN0-0006bw-2r
	for mharc-qemu-riscv@gnu.org; Sun, 11 Apr 2021 00:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lVRMx-0006ai-Or; Sun, 11 Apr 2021 00:06:43 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:44756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lVRMs-00076g-E6; Sun, 11 Apr 2021 00:06:43 -0400
Received: by mail-io1-xd2c.google.com with SMTP id v26so9960091iox.11;
 Sat, 10 Apr 2021 21:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEjlX+UpnUcwU5iICSNuY2Ifhlka3JOnrYd2f5+sJyg=;
 b=UNZgxUA2mBhUnxJGa11yYVMpJ29O+UUfiIuIpCwuXuJCZJisvrdunfun4jPtq+3BIt
 a9tMwkjaIdvRyYm2HwE71rnKWVcK4nxGB+Dgi3a5uww7+LbGmOoa6+657UBnmdBPUcsX
 lkEAN+WPCMPNf8p551ourBUkZot8pNlGiw/a2eW4dlm7QC3sJ3OONb4bZyVo3t1doP59
 5p+rzyT+cg2SSbQAHzzj1RGxnBuzX3+lb0WHKLDeUxGMagybrT9ic17eS+vJRq0LRPSA
 rkNRw5Y2S4MHvcJcx/2Kb/vKX6vmK4r5iclpwEHAvXgIiS6VT4voPfX63dYjTxV4p3ES
 c5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEjlX+UpnUcwU5iICSNuY2Ifhlka3JOnrYd2f5+sJyg=;
 b=uRVopidK6Rd31PTZOl9AMf4Gt+WiNzdm+dC6iuPbYWwdf51zoiiAx41u39kjRanQjj
 h0VtD2zuosz4jow7ASsLe6Jfl1/xIIxVoemwb1E9wdbCEP8waKAFuX2IkVak1EVqNQzS
 kYwdYypPxi52oQgpcaNK7s+jMtyYuQiyewx5zA/tKMMQBMTBVALcAzAhAUqcxm/Kw+1o
 PRh8Asl4bRpOlbT0GkkcI65MJOSiRHre8AoR9iBNxp3ITxcci/qUxdR1HZvBUkYTjkh7
 OUHJd3Z0ITh+mRsfP3YWZTFvQ2Z8ve/vE9iKOHkMG0gsCvgiB2Xe83KZK3qqOo+7nIrw
 VAAw==
X-Gm-Message-State: AOAM5337quSzVQBep0EtbsoDYsFf3E1g6VXCW5yY0zVNkjsXVkVnVkma
 2SvmUz2lLeWF25z5tFOiJaadNICqPt8c2QmL0Jw=
X-Google-Smtp-Source: ABdhPJzJafn9jYlHxUTCxMXnwDhVAtXAFfXHDvoND6Yv8oL20w4LtFRM+zMDwDTWVAuus/9t/L/we4ups6TooKIj41c=
X-Received: by 2002:a6b:c8ca:: with SMTP id y193mr4563306iof.105.1618113995512; 
 Sat, 10 Apr 2021 21:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617970729.git.alistair.francis@wdc.com>
 <3f4a8b1fa0cd5deed00beb585010d6b1cc59efb6.1617970729.git.alistair.francis@wdc.com>
 <CAEUhbmWgOcma-uHBU0Zb8BhDpvt6D06Qg1_ACNzGGzXV_L=MBw@mail.gmail.com>
In-Reply-To: <CAEUhbmWgOcma-uHBU0Zb8BhDpvt6D06Qg1_ACNzGGzXV_L=MBw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 11 Apr 2021 00:06:09 -0400
Message-ID: <CAKmqyKMaL8FA3EMsRB2=ujSj5JMpxZ_yn5sn1q3v9JsF+8Rbng@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Sun, 11 Apr 2021 04:06:44 -0000

On Fri, Apr 9, 2021 at 10:33 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Fri, Apr 9, 2021 at 8:23 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > From: Hou Weiying <weiying_hou@outlook.com>
> >
> > This commit adds support for ePMP v0.9.1.
> >
> > The ePMP spec can be found in:
> > https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
> >
> > Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> > Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> > Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> > Message-Id: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> > [ Changes by AF:
> >  - Rebase on master
> >  - Update to latest spec
> >  - Use a switch case to handle ePMP MML permissions
> >  - Fix a few bugs
> > ]
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/pmp.c | 165 +++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 153 insertions(+), 12 deletions(-)
> >
>
> It looks like the v1 comments are not addressed?

You are right. I sent this before I saw your comments for v1. I will
address those comments in a v3. Sorry about that.

Alistair

>
> Regards,
> Bin

