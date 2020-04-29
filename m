Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTtOE-0007Gj-Lt
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 16:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTtNU-0006Mq-Kl
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTtLK-00075T-24
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:20 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTtLJ-00075J-Mz; Wed, 29 Apr 2020 16:30:05 -0400
Received: by mail-il1-x12c.google.com with SMTP id i16so3748211ils.12;
 Wed, 29 Apr 2020 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JD309+QP5aFGYpEOtu8FSUsMrucDubhseVn8EEOeRlg=;
 b=MqS9Oo3oWvMBiggMraC8eBDe8LYgBImF8SovpaFkfIJHY8U+1xsrRZZ4k8NBiabP7A
 7BxVPK4wURf7U53RnJdmZxaz9AeqsJ2XBWAV6E4DJm94BLL2VCbKT3vXY4q6LKBCpI8X
 uUS9oGwuZRt0hEQq+GyepFDjQEqPipeLVg2x4W8zuIi/PbhvEV8sJUj+7lsZVP2+Fbgh
 0AjvjHf2xOAEQ/Y7VUzInehaTXY5qGRqaDmNA5rz0FYK/pq4MZx/C3rKVx6KGOwik8hg
 AHocB/5D63LQ2/RqPLjfec4M3tB1kSklS2HaIwaTIYg7xd/t60G5Fv5LMyzH8eTDxWqB
 xyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JD309+QP5aFGYpEOtu8FSUsMrucDubhseVn8EEOeRlg=;
 b=SsDIP92Rbdg3x4/X662/nBVvKB58FjNuc7iQ6md/wTb4Fw0AHt0ejF4KjIqxWT6Y8M
 Ll3oPSXdiRrH9/Wtc5Qajhe+DNiq8+lYth732hUah1V/C2lX4whhztDIdCQpu04NDZMj
 Z/D+q80ZVoNcTxg3f6bnEb9WUFncYvLSE4Vod5AUS/eZjTYHLAN4IgHVpwiNBcPYcVJZ
 BjbVXGtasHDOaJs5onZhoSVmXO0S3xy8siaU1VM/h35YgCCI52aZnB6YF8lElXIV47jV
 juF9VrHecg00fVhXUgGPy1sOiikhxMoblj5wYK8xhE0HtJO3ARE1MPkFkdbU3QvXQWWp
 2g9Q==
X-Gm-Message-State: AGi0Puba3BgshJpAj1tNFLqVKKutcjqpI2ly1VKRG6PPRedgqIz8562e
 7V0fS7pSta6hHIPzhmE7ZBpw9Anq8yRMrdOCB2E=
X-Google-Smtp-Source: APiQypLlut6ezUjrJJ253PgGbs0C5jdBSO7pBqScUr3PZjo/8K5CMDOqoBl6HlMMEmONFYO+RiWUoZQoN91OJbzrtHg=
X-Received: by 2002:a92:d0c6:: with SMTP id y6mr131493ila.227.1588192204100;
 Wed, 29 Apr 2020 13:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200429182856.2588202-1-alistair.francis@wdc.com>
 <CAFEAcA-ZqDFo=D3YZgqLpvhzW+Jq8h-JNynDS05E2bSa6FOLEg@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZqDFo=D3YZgqLpvhzW+Jq8h-JNynDS05E2bSa6FOLEg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Apr 2020 13:21:30 -0700
Message-ID: <CAKmqyKOwRrZZ+z1n_e=avxLs62TfN-Js4ounWWcd0p-gzR4nDw@mail.gmail.com>
Subject: Re: [PULL 00/14] RISC-V Patch Queue for 5.1
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::12c
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
X-List-Received-Date: Wed, 29 Apr 2020 20:33:05 -0000

On Wed, Apr 29, 2020 at 1:04 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 29 Apr 2020 at 19:37, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > The following changes since commit a7922a3c81f34f45b1ebc9670a7769edc4c42a43:
> >
> >   Open 5.1 development tree (2020-04-29 15:07:10 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20200429-1
> >
> > for you to fetch changes up to 23766b6a35d5b1664ab782c02624bf2435c4ed5d:
> >
> >   hw/riscv/spike: Allow more than one CPUs (2020-04-29 11:23:44 -0700)
> >
> > ----------------------------------------------------------------
> > RISC-V pull request for 5.1
> >
> > This is the first pull request for the 5.1 development period. It
> > contains all of the patches that were sent during the 5.0 timeframe.
> >
> > This is an assortment of fixes for RISC-V, including fixes for the
> > Hypervisor extension, the Spike machine and an update to OpenSBI.
> >
> > --------------------------------------------------------------
>
> Hi; this doesn't apply to current master. The conflict looks like
> it's probably pretty easy to fix up, but could you fix it and resend,
> please?

Done!

There was a conflict with the other PR that went in after I sent the
PR. Should be good to go now.

Alistair

>
> thanks
> -- PMM
>

