Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1je06F-0004Di-IQ
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 13:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1je06D-0004Co-Pl; Wed, 27 May 2020 13:44:18 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1je06D-00043k-0o; Wed, 27 May 2020 13:44:17 -0400
Received: by mail-io1-xd42.google.com with SMTP id r2so16687049ioo.4;
 Wed, 27 May 2020 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VN0HAw1UpgCzRN5REzb2GYHooDMY8JPD7ej0ICJDsH8=;
 b=AESdMemZyL1O36rB6D8KoJu+JpZM13QrhCSc8JsPgvXm1hA4mg9i5etb7629NrWKM/
 Y5l7yrhcrjxxIG4icMfNrTCz8SWYOjOz+QgqjMRac4CLrMIgps6xUV+YDgjNTmMgFXBz
 nANgq4euByIAX01BKtiE0VL1fwLSYwwS9H1ufaiqRAsCHqKANHv3bY7mUOwNLi6YdpK4
 qP8AHctrbgyr1g+NLt4LpSypHvuJCdgBYYjUgcXya6n0XN5Xyz12tOps1y9eR8QcP8o3
 XFPngJwa5bTAr/SaaUnfeIF78RwnLqOpafCjjHeeRIPuArvPSOupd5A6TiEnYLGypeQ3
 G0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VN0HAw1UpgCzRN5REzb2GYHooDMY8JPD7ej0ICJDsH8=;
 b=pRHdD7vdIzbKTbIk5uA0nw4hA1mZTnk7WosuwNQPbCHDPuVLZ7STMmqmgmZjEP/Sou
 /okBgtKj7SR36SZJQ9yodzRuDokcxUrSLTeF2DLdRYm24Me7U0/q+/sMulexZfs1tvpf
 B7O60E28a8mCxWyFdratvM37fEHnpfXJBdu+IvGbgTI3Z2TLmjXrTIyGTpdK95Y3EowY
 5mkG9MmGltHgfV+5wiwR3nIOEJv1hwaXDH8VpHfwhWQGjNV/cOvyST3d4j0wRIQlXU5m
 nJqREkrZkD3XVeBU8oMsXF0zZnW+3YWvMtvrQHq9RMqxEddygG/r5G7bAYCeNa/xdSQU
 5/cQ==
X-Gm-Message-State: AOAM530EgGrOwiDgBQ/ltq+1+7BuqqBk7FSZmjAXxPiIqWGi7u3jp93r
 hj5s2smgIkK9t3u9raAobRjPW7QrxigHtnNpldw=
X-Google-Smtp-Source: ABdhPJzpxqmVsMOmcjNqN84PH6cBQwqfvSVnXIrqqQ0Z4/VsTB8U/HxdC9Y2yjOo1ettNJTIvg5bqXZqB0Uy6xPgJS4=
X-Received: by 2002:a5d:9604:: with SMTP id w4mr22671642iol.105.1590601455208; 
 Wed, 27 May 2020 10:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590533156.git.alistair.francis@wdc.com>
 <0c7494fe-f812-9ee4-6c35-bc1991d0aff2@redhat.com>
In-Reply-To: <0c7494fe-f812-9ee4-6c35-bc1991d0aff2@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 May 2020 10:35:15 -0700
Message-ID: <CAKmqyKOY0m0uZMLH1wcS=vaJqy-EEBG=Sm0t5uLaLt8u366Miw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RTISC-V: Remove deprecated ISA, CPUs and machines
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 17:44:18 -0000

On Wed, May 27, 2020 at 12:17 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/05/2020 00.47, Alistair Francis wrote:
> >
> >  include/hw/riscv/spike.h                      |   6 +-
> >  target/riscv/cpu.h                            |   8 -
> >  hw/riscv/spike.c                              | 217 ------------------
> >  target/riscv/cpu.c                            |  30 ---
> >  target/riscv/cpu_helper.c                     |  82 +++----
> >  target/riscv/csr.c                            | 118 ++--------
> >  .../riscv/insn_trans/trans_privileged.inc.c   |  18 +-
> >  target/riscv/monitor.c                        |   5 -
> >  target/riscv/op_helper.c                      |  17 +-
> >  tests/qtest/machine-none-test.c               |   4 +-
> >  10 files changed, 60 insertions(+), 445 deletions(-)
>
>  Hi,
>
> looking at the diffstat, I think you should also edit
> ./docs/system/deprecated.rst according to your changes?

I'm not sure what I should edit there. These are already marked as
deprecated, do I need to make a change when they are removed?

Alistair

>
>  Thomas
>

