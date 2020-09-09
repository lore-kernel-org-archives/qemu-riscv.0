Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kG67y-000272-AB
	for mharc-qemu-riscv@gnu.org; Wed, 09 Sep 2020 15:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kG67w-00025H-PE
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2020 15:51:32 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kG67u-0000AZ-NP
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2020 15:51:32 -0400
Received: by mail-pf1-x441.google.com with SMTP id w7so3105175pfi.4
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2020 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PM6b8NvEPBftJFD5nS5xU2vW5iS1qMZHydV4wpfZ2Ks=;
 b=Fj2o1ndfPnbw9g1z+lZCzE4jUvVrW0FXm4YWYZjtxjis9MV9d2M8ve7BWMXFsLqZy/
 heK9GoUmX/DMCMvEWVHZJc5UMDUfZj7bIThIEV40+FBjCBm/6Pv9HBTOq8X4fIAgUDFn
 n9X3K8oOjp3UBuKDIcoce58cnXjFd6QIkvvoUOKXmvdMvWSG8ljka6a8UBlJOVNtH43V
 N9avig1JNbaqKiDDt+cS4btehzWKPxg0MBvnHddhNyOx+ouw3NAtREaVZNNiRYVlY97S
 OVjrJ/eWfLQbMsOI7tOztv5mCF2axoSILHflvFof3OtrE0J/E6PbhE3sswKLLGdw+O36
 gf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PM6b8NvEPBftJFD5nS5xU2vW5iS1qMZHydV4wpfZ2Ks=;
 b=mNcQ1HZ8ZZrmYcj2i2nuFXBCwdzbSAcX0HSGlnP2w5w0PjL7Wlt5uj3kZMSdGjyk3u
 +PYd4t6od0XEIIUUnMyycZxAAj+taOEWNdVksMCuWdPkk0XZLbRdgd/iyIBA/c4dUZ+/
 UZ9QivtdCxOQP7gfEZajiW45s2NVoN4VKD/CHCFnXsaIwUUHohXMXoxanGjePejezqNZ
 MefYyMD3qpp0OKrLj57+5Jq4vphXlhhdZwB4Y3RYrX/65Oi9hCRqhaDVWlgagZk22Fvo
 dz8gRJEQBEifv4zLqxiDBx5FFju0LIyJTuLCpuBQ/+jVAvAaNtQ5Pvsl6IECAeoB7rb7
 nYFw==
X-Gm-Message-State: AOAM530lZ1xYFEb52DhrDUsp1+9KQlpZ+P/GH/4FCJRJXDWcB1xfiDXD
 yez/G+S2YVelKzA23Eub24kXCw==
X-Google-Smtp-Source: ABdhPJx3H+tDCjsvCpsPJ5n+D++fl/UlP2tqDT6Hqstd4QxfvzasrR26Egq+rOysnGLEY3pJxzzSfg==
X-Received: by 2002:a17:902:d201:b029:d0:cbe1:e7a4 with SMTP id
 t1-20020a170902d201b02900d0cbe1e7a4mr2346068ply.21.1599681088198; 
 Wed, 09 Sep 2020 12:51:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l9sm3152769pgg.29.2020.09.09.12.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 12:51:27 -0700 (PDT)
Date: Wed, 09 Sep 2020 12:51:27 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Sep 2020 12:51:26 PDT (-0700)
Subject: Re: [PATCH v5 06/11] riscv: Initial commit of OpenTitan machine
In-Reply-To: <CAFEAcA9RcbWeM=hhUNH=Exdp_QT4s0GcCJdrpcvWkv2ea+o7cQ@mail.gmail.com>
CC: alistair23@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-13d2ebf6-70bc-4130-9e11-6fa4391c64db@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 09 Sep 2020 19:51:33 -0000

On Wed, 09 Sep 2020 12:00:07 PDT (-0700), Peter Maydell wrote:
> On Wed, 9 Sep 2020 at 19:00, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Tue, Sep 8, 2020 at 7:52 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> > ...shouldn't the riscv64-softmmu config have CONFIG_OPENTITAN too?
>> > The usual principle is that the 64-bit executable can run the
>> > 32-bit boards too.
>>
>> I didn't know that was the general case. I'll send a patch to enable this.
>
> Somebody on IRC suggested that the riscv code currently
> assumes that #ifdef TARGET_RISCV64 implies a 64-bit CPU,
> ie that the 32-bit CPUs don't actually behave correctly
> if built into the qemu-system-riscv64 process, so you might
> want to check that things seem to work when you enable it...

IIRC there's a whole bunch of that floating around the RISC-V port, so just
tossing a 32-bit CPU into qemu-system-riscv64 is going to result in garbage.
At the time we originally did the port we though we weren't goin to have
mixed-XLEN systems, but the ISA now allows for it so in theory we should go fix
all that.

I don't think anyone has looked into doing it, though, as there isn't much
interest in mixed-XLEN systems (though oddly enough there was a glibc post
yesterday about them).

