Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAq5D-00006e-0s
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 05:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAq5B-000064-6l
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 05:24:17 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAq59-0007Ls-AW
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 05:24:16 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so21253326fac.8
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 02:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTNNPjAuEyJBk9lPL3l6wV8Vn0wUPR0Gths+p/cjqg0=;
 b=YXQDnbPkeAGDWChoFVeeBf9NgTCMazziEfJ4qgtnigmdIZeUpszcz7Xbq+SAOgOui/
 4im0dUDW8J1f0Sp6Dk4rklyuLHiAkWG3dpllRvtFFRgTDVWU+0ZGBARCbAHFV/Q2aWAI
 A6dfI2iZf6Ev+1Z0VvfLEyx0BcKFFdBGP2SNzQAI8O0EmFhdbByWpdPuPsKuXz3iQDJp
 at1K3fQk5w2xxYIw42nmrIkaDECE3zBxFQzjvn4zfVjN/tHqqwy78pfI9uMNBogsfNpw
 ctY2xcJIXML6suUsZZBuoP4G11B4Z9vFKq3MT0KcUHzv2u4rXWcCaq+8f3bxPl7ea5rl
 HJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qTNNPjAuEyJBk9lPL3l6wV8Vn0wUPR0Gths+p/cjqg0=;
 b=B8X+V3MuwQOlEpbCEDo/g+9u1d9+s518wZZi+hLv6G9SYrcl1jr4S2j+c/Gszp27TM
 2eWkXtDJ4r74GaYxrjG1eahClOpwk94c7jPRq6MUL8nEf7/nJHfyY3BwzepR2tB73NNg
 qTolrQgCouihddbgECDGC4hewd97/5XoaTpBDh/bRhBiJPMpXcah54MMouA1kpuMhsUo
 WiJ3WlpJuYOf4pp0v373Ygzg6DulBTH68CqxsAESNue1HihkrNmDqHfomQ/uIfqxgRja
 CuHKIPyh9e9xW1jQr1CcGdF/3dwzIEX0DFP4vrYWQ4wDUqTLmPbzv4+bUXqm81nnKG3f
 x4Ug==
X-Gm-Message-State: AFqh2kpBkgeT4Xp3/lT/1Bqoo87/OPP2yrwZWDU4KTeZxIv6LXqbCcei
 hxqZJ1cLbK/uu/v6IMQJnLcqhA==
X-Google-Smtp-Source: AMrXdXuhj6+May2vOdi+e7qmRc3elQyEnHYRnY5YrtPyFq/b4WOyhy2TsxKStbCfOmJEtXRjIXo00g==
X-Received: by 2002:a05:6871:a6a5:b0:143:9c9f:c7e0 with SMTP id
 wh37-20020a056871a6a500b001439c9fc7e0mr12324777oab.57.1672309453678; 
 Thu, 29 Dec 2022 02:24:13 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 be4-20020a056870588400b0014866eb34cesm8440216oab.48.2022.12.29.02.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 02:24:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------JPu4qFv2O8SKK7plWKDF02ee"
Message-ID: <ca5bb1de-652c-8074-5b49-867e40d0a818@ventanamicro.com>
Date: Thu, 29 Dec 2022 07:24:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221229091828.1945072-1-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 29 Dec 2022 10:24:17 -0000

This is a multi-part message in MIME format.
--------------JPu4qFv2O8SKK7plWKDF02ee
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Bin,

Not sure if it's a problem on my side but I can't find patch 12/12. I didn't
received in my mailbox. I tried patchwork but didn't find in there:

https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352


And it's not in the ML archives as well:

https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04581.html


Thanks,


Daniel


On 12/29/22 06:18, Bin Meng wrote:
> At present the 32-bit OpenSBI generic firmware image does not boot on
> Spike, only 64-bit image can. This is due to the HTIF emulation does
> not implement the proxy syscall interface which is required for the
> 32-bit HTIF console output.
>
> An OpenSBI bug fix [1] is also needed when booting the plain binary image.
>
> With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN & ELF
> images can boot on QEMU 'spike' machine.
>
> [1]https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
>
> Changes in v2:
> - fix 2 typos in the commit message
> - initialize firmware_end_addr to memmap[SPIKE_DRAM].base
> - rework the htif_custom_base detection logic
>
> Bin Meng (10):
>    hw/char: riscv_htif: Avoid using magic numbers
>    hw/char: riscv_htif: Drop {to,from}host_size in HTIFState
>    hw/char: riscv_htif: Drop useless assignment of memory region
>    hw/char: riscv_htif: Use conventional 's' for HTIFState
>    hw/char: riscv_htif: Move registers from CPUArchState to HTIFState
>    hw/char: riscv_htif: Remove forward declarations for non-existent
>      variables
>    hw/char: riscv_htif: Support console output via proxy syscall
>    hw/riscv: spike: Remove the out-of-date comments
>    hw/riscv/boot.c: Introduce riscv_find_firmware()
>    hw/riscv: spike: Decouple create_fdt() dependency to ELF loading
>
> Daniel Henrique Barboza (2):
>    hw/riscv/boot.c: make riscv_find_firmware() static
>    hw/riscv/boot.c: introduce riscv_default_firmware_name()
>
>   include/hw/char/riscv_htif.h |  19 +---
>   include/hw/riscv/boot.h      |   4 +-
>   target/riscv/cpu.h           |   4 -
>   hw/char/riscv_htif.c         | 172 +++++++++++++++++++++--------------
>   hw/riscv/boot.c              |  76 ++++++++++------
>   hw/riscv/sifive_u.c          |  11 +--
>   hw/riscv/spike.c             |  64 +++++++++----
>   hw/riscv/virt.c              |  10 +-
>   target/riscv/machine.c       |   6 +-
>   9 files changed, 217 insertions(+), 149 deletions(-)
>

--------------JPu4qFv2O8SKK7plWKDF02ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font size="4">Bin,<br>
      <br>
      Not sure if it's a problem on my side but I can't find patch
      12/12. I didn't<br>
      received in my mailbox. I tried patchwork but didn't find in
      there:<br>
      <br>
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352">https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352</a><br>
      <br>
      <br>
      And it's not in the ML archives as well:<br>
      <br>
      <a class="moz-txt-link-freetext" href="https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04581.html">https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04581.html</a><br>
      <br>
      <br>
      Thanks,<br>
      <br>
      <br>
      Daniel<br>
      <br>
    </font><br>
    <div class="moz-cite-prefix">On 12/29/22 06:18, Bin Meng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20221229091828.1945072-1-bmeng@tinylab.org">
      <pre class="moz-quote-pre" wrap="">At present the 32-bit OpenSBI generic firmware image does not boot on
Spike, only 64-bit image can. This is due to the HTIF emulation does
not implement the proxy syscall interface which is required for the
32-bit HTIF console output.

An OpenSBI bug fix [1] is also needed when booting the plain binary image.

With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN &amp; ELF
images can boot on QEMU 'spike' machine.

[1] <a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/">https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/</a>

Changes in v2:
- fix 2 typos in the commit message
- initialize firmware_end_addr to memmap[SPIKE_DRAM].base
- rework the htif_custom_base detection logic

Bin Meng (10):
  hw/char: riscv_htif: Avoid using magic numbers
  hw/char: riscv_htif: Drop {to,from}host_size in HTIFState
  hw/char: riscv_htif: Drop useless assignment of memory region
  hw/char: riscv_htif: Use conventional 's' for HTIFState
  hw/char: riscv_htif: Move registers from CPUArchState to HTIFState
  hw/char: riscv_htif: Remove forward declarations for non-existent
    variables
  hw/char: riscv_htif: Support console output via proxy syscall
  hw/riscv: spike: Remove the out-of-date comments
  hw/riscv/boot.c: Introduce riscv_find_firmware()
  hw/riscv: spike: Decouple create_fdt() dependency to ELF loading

Daniel Henrique Barboza (2):
  hw/riscv/boot.c: make riscv_find_firmware() static
  hw/riscv/boot.c: introduce riscv_default_firmware_name()

 include/hw/char/riscv_htif.h |  19 +---
 include/hw/riscv/boot.h      |   4 +-
 target/riscv/cpu.h           |   4 -
 hw/char/riscv_htif.c         | 172 +++++++++++++++++++++--------------
 hw/riscv/boot.c              |  76 ++++++++++------
 hw/riscv/sifive_u.c          |  11 +--
 hw/riscv/spike.c             |  64 +++++++++----
 hw/riscv/virt.c              |  10 +-
 target/riscv/machine.c       |   6 +-
 9 files changed, 217 insertions(+), 149 deletions(-)

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------JPu4qFv2O8SKK7plWKDF02ee--

