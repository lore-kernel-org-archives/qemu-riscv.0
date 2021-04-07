Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU9Aa-0007ys-NV
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU9AY-0007ur-R6; Wed, 07 Apr 2021 10:28:34 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU9AX-0002HF-8k; Wed, 07 Apr 2021 10:28:34 -0400
Received: by mail-io1-xd34.google.com with SMTP id k25so12658533iob.6;
 Wed, 07 Apr 2021 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjJ1kUXZxVVWblohrpgwxsHcHagz0UwFV1ZKUh92DDQ=;
 b=rsYvNEp3XL4Yy1P7tZT4sNqH8TTNAxvINIL3I81zhxSWrQvr8dVN+rTHX8l/2UcUsg
 AqaAELGsWJ89VyEtL2cgW9oQCuNNHxH5v6X17qLyVViqU+5ZNNaNRRU+IgKPb8JZtt2d
 5hMOnBpeYIznWSBFYNWdTYwcVkDoxl1mL1G+QANtWHMIYDJh5eWcmBPsu3pT9hBpEWyA
 c+YwLnZUkt34E0eNVQhfw8eostyap+S/7hUIB9eXozqZcGFfZ/49HKdOBzPZRIsuQy0n
 PTCEEq7aNCAeR++Cm+NNn2bBay47a42V00qv+OFSiN6+zAZNrZciWDe0mGgcWAKQC3I1
 i00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjJ1kUXZxVVWblohrpgwxsHcHagz0UwFV1ZKUh92DDQ=;
 b=Jy3Tl8ropoHMggk0HKFd6pBqUpL01hv1stmAfyUiiU+eHYvXyZGK8WUCZlppFSzc+c
 npOiiv3zSAflts/nd8YLPTlCDNYWeB9vyoh2nZKLxioTj1ca491MiuUY6ZLf8gcukYZg
 ltuEZolnZbgXvtXbNhjMCzMkTQqxjZt+1NsJbKpvBu0CG3//saCgPUiALEOSIikR7WEo
 JPIRqaqoi/CiIKJW189mxt1+lI0zFVv0lSczNm9Db+gMoYp54LKhM9Kab5IHPUc+9JOg
 rW4xMFpbNhYNso2jBN8fBnUUcSg9DDHHjX7HEHBWv2kWJXox9vrEmZh8CPWkYZX9igy/
 nT5g==
X-Gm-Message-State: AOAM5328uCl1y6LqnvazQ+B+K4sYnuqVi2l2e3M0QRndxKzdjN6xyla3
 S8vyg/atVj06GbacMO7KXvWtTETY4hGnw4CsszA=
X-Google-Smtp-Source: ABdhPJyBenjyTT8hiY6JwaNwRqXbIjZyNH2vmtrIk0yOSXiuI9BuE+UXg8qoNc0ioL8ZLpt2vyzREa/d2rutKByLMp8=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr2846887ion.176.1617805711762; 
 Wed, 07 Apr 2021 07:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com>
 <CAEUhbmUXswCjYfms_Bmj34yzp+ha+2KgdB06Bh_Xj7S+Lmr-Tw@mail.gmail.com>
In-Reply-To: <CAEUhbmUXswCjYfms_Bmj34yzp+ha+2KgdB06Bh_Xj7S+Lmr-Tw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 10:26:11 -0400
Message-ID: <CAKmqyKOFMZZoZpLm894XynP77KdVt+HKHF+SSgm4G8kfEess1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv: Enalbe VIRTIO_VGA for RISC-V virt machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:28:35 -0000

On Tue, Apr 6, 2021 at 4:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Apr 2, 2021 at 8:44 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
>
> typo in the commit title: Enalbe -> Enable

Good catch, fixed.

>
> > imply VIRTIO_VGA for the virt machine, this fixes the following error
> > when specifying `-vga virtio` as a command line argument:
> >
> > qemu-system-riscv64: Virtio VGA not available
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

