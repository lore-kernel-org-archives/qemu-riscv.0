Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGPz-0003M0-SF
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGPf-0003KK-2V; Tue, 26 Oct 2021 02:58:28 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGPV-0004S0-IK; Tue, 26 Oct 2021 02:58:22 -0400
Received: by mail-io1-xd32.google.com with SMTP id m184so79909iof.1;
 Mon, 25 Oct 2021 23:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tufujr8Z15l2N5wsYdYhsfkFyGfxChRuDLAJRu593tM=;
 b=Qt21+lrjyJJJSp57zaqt2wu7M6cSWyASE1XjhpCu84Yv4X/9aUWrYZF/2CWeSVHRtz
 e05txfFDRiv1iOA+piDsWtkAfcOUqLO/zE2ic9VQ0Aua/nPcMvYv026nbUql86nTM7BQ
 pzKutbbIuTH+IRhdjJaXNFi5z3bX+o0pHOTO9pyyAprn9QNtEBpgk+e57eVsizsBt4ET
 HXHI6D+OV5jHqqa8bmEB4b1PRlhj8FH+Z3aRtGxMAcL2pTh3jsV3ie4iPkhp3js8QVKH
 JLPm2doy11NlaLd1j9EiDMoYlHOriWSW8FwA66UxwKXgqKvkup5HfMHxyNd/n9Q0mBPT
 MqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tufujr8Z15l2N5wsYdYhsfkFyGfxChRuDLAJRu593tM=;
 b=xp0oI92OS8jOk+afiVIDZYg1GlOB1C+3WAd18fTYv1G3k/xEujwLQoXheErtkwc2MA
 U61QXNZBOPE5uYpkMzcRcUpd+lAPtcX+H06b0PTV49ymF3Cj5ADdCgSqhhznNOdoqOvQ
 NZ3QW0pV2W/AMU+24d7iykKIH62hekG6DzxVSLG+WhVEfFPdbjVyVjMizUvu7o2oZcLU
 q+snKdktDlAmB7zDLmzo9eLcMFtDUCmIDkFqPu/JmPtLWfrkmA3AeLg5iwrSvfglMqwW
 f4oYRQCyMfpsNlpPUOazvIkJdHrCs04+LEpdU664enmbGdDKnGOO9Vppn5QHqOmwAwmA
 9MSg==
X-Gm-Message-State: AOAM533rdNO9aYgLUerQnt0BXicJ7Q95mDnoIOj0QX59QEll2gghda4Q
 fEPtYPYJ18doNxcTbdRag3UnmimRT/0x7lMbDz8=
X-Google-Smtp-Source: ABdhPJxhGY4wTODjameSOipVj3/Tya8qg2f/qG1mZdtaJxlRB+1BSSo2WITxFljuAHkVhdka38DHAGlVKjMStaw2hRI=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr13803245iow.91.1635231492081; 
 Mon, 25 Oct 2021 23:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210522154429.361235-1-josemartins90@gmail.com>
 <CAKmqyKNSG4ACk-QQ9_0XzAXWr_NPE3sijxbs+6Kz3J=N_k+LMw@mail.gmail.com>
 <2e3c4d2f-475f-4d02-6be5-a89628cd6815@c-sky.com>
 <CAC41xo1ftM_WcjNOio2ii-BtqtDh6RTEvsmwO69GU6taOCzYRA@mail.gmail.com>
 <CAC41xo12s+uHEyLkc6vO07iBAC84o6aHBFFdqxDm3NQjBYjuAw@mail.gmail.com>
 <CAKmqyKMb-VNiQZv-ZFeCMwPQ3hkm1ODn_w55pGdBgpxtwg8tnw@mail.gmail.com>
 <CAC41xo2yWzJgttwEn6rG_wmkarN58OLmV0nh1ksbbjRG1gpuYw@mail.gmail.com>
In-Reply-To: <CAC41xo2yWzJgttwEn6rG_wmkarN58OLmV0nh1ksbbjRG1gpuYw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:57:46 +1000
Message-ID: <CAKmqyKMMumiG9Kv+Ez=U1WmTnkuCN=UYpJRE6o4cAHPUoh6uQA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Oct 2021 06:58:40 -0000

On Mon, Oct 25, 2021 at 7:48 PM Jose Martins <josemartins90@gmail.com> wrote:
>
> > From your last response I thought you sent a different series that
> > replaces this patch. If that's not the case do you mind sending this
> > patch again?
>
> I already sent the patch series here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg00553.html. I
> got confused, I should have raised this issue in that thread. Let me
> know if you still want me to resend it.

Weird, I somehow lost them. Can you please re-send them and I'll apply them.

Alistair

>
> Jose

