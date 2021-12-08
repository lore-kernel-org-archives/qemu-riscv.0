Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muvTv-0003Nf-QY
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 06:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muvTt-0003MT-Ha; Wed, 08 Dec 2021 06:51:29 -0500
Received: from [2a00:1450:4864:20::429] (port=39932
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muvTr-0001yh-Ht; Wed, 08 Dec 2021 06:51:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id a18so3615446wrn.6;
 Wed, 08 Dec 2021 03:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fOVs0Q4rnvinaD0GFmHqxboA68kMJ8M+f0bJ0rUSoM8=;
 b=hRaQw9Uc/tT/KDeg4gBfjMZ0Bw8bz3oX1yuM8hIRC4GVmZU0vcYIJeCqwbUsjavxza
 6BLDtyBP47TeJC8FT1loVifidzkWkRFoI/BiBDXH02s61aQslGmfuw3ShRyQN7G+vktF
 eoCzptZvQ/INmLA261RkQltmfD9uYktiu/aUItVazkVHRFBb8OTEbFW5+VfOcKxAlT+J
 paoH4plzWqkv9KBcE5tJKytGzjb+ZsDxDpEA4EKAMnuBtQuoiayU4bP6jDlxar0Vt7JH
 mQAnVIhmAetVznHZdNHppGuRXSSLWKVv4ciZ1E/gcpTBV/q/jRj7yRmNle716rvsI7KQ
 Sh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fOVs0Q4rnvinaD0GFmHqxboA68kMJ8M+f0bJ0rUSoM8=;
 b=QJmPg841LiKOEhw2g4Sbk7F70MmJ6X+hceTb5d2NGsqz/vAH7vvbJsfZPonjOLn59J
 GlyNvSK2QRVZW7OgSiie2OqE6ClNf3MAk3iVfytkhiUimCmO7TiyzxGlX5exuvdifFgn
 1uWH8Sw02E4T+SorTivECUNctKbUi+WLAWuq1JyKSFg+WNEpxwVRnNSM12C1TcLGEwjj
 fIqjZvlXRMgPoU3Y9pC/zXyhZdSlrSDY6yfS2tS+wuuF8gUPs7eqHGj1FP/INkSABAmN
 gPsLBsEcrOkBgd9gOVYvjK85oIY2hmpLA+2P/6TINB/8kuWl6+05/C6lP/P2xTjVagDH
 dajQ==
X-Gm-Message-State: AOAM5319OsvvA7d9x5+dsghqQtX60CAoJ83K5UimRxg5qTplONfZ7B9w
 zAs/7qksHi0nkGri4n0FkgM=
X-Google-Smtp-Source: ABdhPJzXXNz5MgpMiRuMKeLJh6qHtG5fKpf3oveZYawSXX0p9HmoIeNjMCCTs/m9W7B0YDTDjJP6Uw==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr57073412wrd.144.1638964285221; 
 Wed, 08 Dec 2021 03:51:25 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id r17sm6635575wmq.5.2021.12.08.03.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:51:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <1a47fc78-8374-d2d1-9a3a-673ed6fefc17@amsat.org>
Date: Wed, 8 Dec 2021 12:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 7/7] hw/riscv: Use error_fatal for SoC realisation
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 bmeng.cn@gmail.com, Markus Armbruster <armbru@redhat.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
 <20211208064252.375360-8-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211208064252.375360-8-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Dec 2021 11:51:29 -0000

On 12/8/21 07:42, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> When realising the SoC use error_fatal instead of error_abort as the
> process can fail and report useful information to the user.
> 
> Currently a user can see this:
> 
>    $ ../qemu/bld/qemu-system-riscv64 -M sifive_u -S -monitor stdio -display none -drive if=pflash
>     QEMU 6.1.93 monitor - type 'help' for more information
>     (qemu) Unexpected error in sifive_u_otp_realize() at ../hw/misc/sifive_u_otp.c:229:
>     qemu-system-riscv64: OTP drive size < 16K
>     Aborted (core dumped)
> 
> Which this patch addresses
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/riscv/microchip_pfsoc.c | 2 +-
>  hw/riscv/opentitan.c       | 2 +-
>  hw/riscv/sifive_e.c        | 2 +-
>  hw/riscv/sifive_u.c        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

