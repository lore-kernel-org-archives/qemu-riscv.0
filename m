Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nC8RT-0000RT-7C
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 18:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC8RR-0000O2-2d; Mon, 24 Jan 2022 18:08:05 -0500
Received: from [2607:f8b0:4864:20::434] (port=46619
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC8RB-0004Cn-15; Mon, 24 Jan 2022 18:08:04 -0500
Received: by mail-pf1-x434.google.com with SMTP id i17so3292pfq.13;
 Mon, 24 Jan 2022 15:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x2HctyTWTUA2pMfuOKsQeyN+JjWYMM9uRoZHzL60EMg=;
 b=EbDkEDT623pampaou0y3R72H+FS6CYnxWg59NIV9/3m35o2MmplPhWDBJ/Oo+m58t5
 vuAg2p+0Gs0LblgdqAWzBGRcc0HY1RwXwlyaJn9YSbn+qtBFMKJh3fZK6TsIjnyQc8Kv
 uLqZs6BTvEomlDGINblMAc4Udd11wgrz+mVdvvI9dNsnitBSsr8/YO6Td1/LT1zp2GN7
 qAj6yIUveKTec47TrngGKLNxB8KzUt6IHHeIyTqs0zZogtH4zbN2WzNI1P4eobrd3IOU
 x3dHTsoIRwxRC6rbXuI2OX/uDCRSxxfkblr/K6fN2a/PnEFVE8z8l7j57g0AkbZfM4l6
 LplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x2HctyTWTUA2pMfuOKsQeyN+JjWYMM9uRoZHzL60EMg=;
 b=ldqv6xS09AFXtftoz8HwAlo77/pnH1EVWyYJPGyjxMngDs2HDF9y+k4Di45S/HYFqJ
 lc42mXhUXVucwtWRZV3qGEiSY/lFyb3tqtTd4SfzjwMJXSLvVSzeGBF21MaXTqQUdILJ
 E7jB2uW8x7EBBU1kRjI0kVKv45Vq7oUowtb4TmLmNkgMlDNOfIdkC3BxT4hArWpootlc
 PutXYOricFsIKE1z4mN/6YUabPU0lGtDzNpSz6Yf9MA2BlLZ7Qy6tG04FtmE2ud1DBxC
 g4rXspcvKO+dwULpSQoX3jxv54BsHCg2L1z4pwDT2OJ7v16wwI4WbKL6a7n6dEbHaQrJ
 0eUw==
X-Gm-Message-State: AOAM533hPnGeYFQz9jw51DTFiVADZPLipo7IQaL6X/oxE3N6ImFpgD3r
 TwtCixyYS5PXqxIvDEUaFnY=
X-Google-Smtp-Source: ABdhPJzJ3nJqkSOrtpnDFag22/28wozAiESMEKuVEJvPLa8af2sDopz9qQ6cJOEQKe6eTbC68MiFDQ==
X-Received: by 2002:a63:8342:: with SMTP id h63mr7947654pge.215.1643065651124; 
 Mon, 24 Jan 2022 15:07:31 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o18sm17651232pfu.45.2022.01.24.15.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 15:07:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <a16351f3-b3f2-5263-a3bd-971a0c4e5f10@amsat.org>
Date: Tue, 25 Jan 2022 00:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] target/riscv: correct "code should not be reached" for
 x-rv128
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
References: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jan 2022 23:08:05 -0000

On 24/1/22 21:24, Frédéric Pétrot wrote:
> The addition of uxl support in gdbstub adds a few checks on the maximum
> register length, but omitted MXL_RV128, an experimental feature.
> This patch makes rv128 react as rv64, as previously.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   target/riscv/cpu.c     | 3 +--
>   target/riscv/gdbstub.c | 3 +++
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

