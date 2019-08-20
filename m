Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0APB-0005bs-UB
	for mharc-qemu-riscv@gnu.org; Tue, 20 Aug 2019 16:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1i0AP9-0005bR-Hb
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 16:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1i0AP8-0007cd-Bx
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 16:06:55 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1i0AP8-0007b6-4Y
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 16:06:54 -0400
Received: by mail-pl1-x644.google.com with SMTP id y8so3294729plr.12
 for <qemu-riscv@nongnu.org>; Tue, 20 Aug 2019 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYuKJlJufpQ6maABKQTxUMxy5UrN7Ns1g6CYu+OMczo=;
 b=UFYivqW0Y1tl2OcsMCEoRe+bbB4z+MM7pHj/1wEbCmeToEbS8tqDYcIPgBXTMjJDvk
 kqSsNfEDbnLRS4am0piki5G+T0l6ntDNcmxP1l29kXrJZnJ65/sHy4BnqVqcj/1Fxujt
 IbFCwFHcPphRVu5yS2bZ1f4aIKtq18U9PvIXsNkAqs/Ksg3v9r9Isq7JknRy3/dZgfe7
 Ig5tTN1nLU4G93NmK5BeQN+C015Ksu8hzGdRQ5h37QPOLPZblrzXkHkLVlk7aZUitf9k
 f2W6Zy1XqsQw+WpV3Zs7NBSMtqnr0NDdjUzrajZ6V5yX4TL5TjKhcJMqY3gimE8utN/4
 nghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYuKJlJufpQ6maABKQTxUMxy5UrN7Ns1g6CYu+OMczo=;
 b=k/1qoK8k8Gbsa056NwF6zYSidhspdH3OV4YwDy/5dncEkC1g7vaSqUqgQZO87QdpTI
 BVnUR45uFzOj/Lomd7cHBPRQsvuCQzS+0fl9e/UgRWaa3DDuRK6bOf5atY1vt1sayHT6
 Dl2Wa/rpZACAxKIkK1G9X1hIuyJXZH3NecGSr4bXJbeo3WYmkG5O2fdYmkDKMHTbacdk
 X8rvS1TTDVBJPUd16PCwY1aWF8l0UZqCqTfbRZJbiKEr3aYvNrwYh3+puS1EnqD8oVy9
 wCLRN+gjKnrdk3cEOe+yWCFGGpdyl5Ey3p9Hf6sW99R5QkcgR24My5O27RNNiNVyRfRg
 P2pQ==
X-Gm-Message-State: APjAAAUwU4uFcPxDVF+NQAX/ZXPtZNcq/QXg21L9lTaBTWXeBKz0Sh9R
 J0SiC3JF8qYv4M/jcdF2mZKPk/QBce8=
X-Google-Smtp-Source: APXvYqyQXXFX+cvmbBOY1jpV5LGdlS95qo6914OG2rmoxjxrJiYgt1QgZesTUJJNEGXdfSUPqaBnig==
X-Received: by 2002:a17:902:7202:: with SMTP id
 ba2mr30793044plb.266.1566331612977; 
 Tue, 20 Aug 2019 13:06:52 -0700 (PDT)
Received: from [10.17.0.199] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i137sm47203581pgc.4.2019.08.20.13.06.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 13:06:52 -0700 (PDT)
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
References: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <79a82be5-38a2-edeb-66a6-25d34246aea3@sifive.com>
Date: Tue, 20 Aug 2019 13:06:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [PATCH v2] RISC-V: Select FPU gdb xml file based
 on the supported extensions
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
X-List-Received-Date: Tue, 20 Aug 2019 20:06:56 -0000

On 8/20/19 7:39 AM, Georg Kotheimer wrote:
> The size of the FPU registers depends solely on the floating point
> extensions supported by the target architecture.
> However, in the previous implementation the floating point register
> size was derived from whether the target architecture is 32-bit or
> 64-bit.
> 
> To allow RVF without RVD, changes to riscv_gdb_get_fpu() and
> riscv_gdb_set_fpu() were necessary.
> 
> In addition fflags, frm and fcsr were removed from
> riscv-XXbit-csr.xml, as the floating point csr registers are only
> available, if a FPU is present.

The current XML files were identical to the XML files in gdb when 
implemented.  This seems to be existing practice, as this is true of all 
of the other targets I looked at when I implemented this.  Also, the 
file names are the same with a / replaced with a -.  These files are in 
the gdb/features/riscv dir in a gdb source tree.  It would be a shame to 
break this.  I'm not sure if they are still identical.  The gdb copies 
might have been updated since then, and may need to be copied into qemu 
to update qemu, but we don't have a dedicated gdb/qemu maintainer to do 
this.

I don't see a need to remove the fp csr's from the csr list.  There are 
other extension dependent CSRs, like hypervisor ones. I think it makes 
more sense for the csr list to contain all of the csrs, and then disable 
access to them if that extension is not enabled.  If there is a good 
reason to require changes to the csr XML files, then it probably should 
be discussed with the gdb developers too, so that the gdb and qemu 
copies of the files remain consistent.

Fixing the rvf/rvd 32/64-bit support is good.  That is a bug in my 
original implementation.

Jim

