Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxly0-0000yK-8s
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 03:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxlxy-0000y1-Py; Thu, 16 Dec 2021 03:18:18 -0500
Received: from [2a00:1450:4864:20::434] (port=45627
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxlxx-0003ep-0C; Thu, 16 Dec 2021 03:18:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id o13so42557494wrs.12;
 Thu, 16 Dec 2021 00:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p5tCa+dHy5xswPnHLHB8LGM/jqV4EU7dfLQEwtpd8vA=;
 b=f48TJxb+ayk4gHBdbgxbCgTzo+aOJPkEURjWQIc0MHfdwTNTlYMohctTBVx0Sqi8jR
 Uu2oJJnnupFg9hkSUmsSFVNCYEpqv6Z8f31OxvC9VPL1hUYkVjU59cI/U1wljXydbhPM
 Q/szuX/cU/VZQ0TV5eANm9QIb+Sf00eNdjhAh+WFKgag5latThAFalHTCJohqjJO8x4Z
 Fb96K+YOtC5OYwfYtGTPHf21jwOCzfhXhCR3H/iBLAUCK0HjKmodhP/POxGPykvWUf/Q
 /r2PFkuUdhiSUrQcLM2toWqV6LX+2jonqUTew436HhMQosuj3KDNzg2MX/zxTwlArlu5
 XsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p5tCa+dHy5xswPnHLHB8LGM/jqV4EU7dfLQEwtpd8vA=;
 b=vkBAPPOo6mGpgmbJD087A1iwA6ovelv5MgZYA9gJD3m17LfpFS+1fgT9N/0abiTS+m
 2Xilyi00C5uNJoe5WrsH3ZaI5TLtRN1H3iEzDMyGrrw1PAhuS1/ngvD6RIn8s2Gf1+BI
 QQkUkZY+GS9Zi4QmI8hkH2V4yz4nvcgm2SXn+nQDZzcke3wyNZKqemNYFaqe4MfleR4A
 DCnZ4I6zUIAdxWhjvCarvI+7yclgJM76lx912FoLSnRalpE2tKQT3M2tfWvsvMhWl+97
 AcqvjI3t0SY2sk1dCcGYcVjkH7b/maFWdbfwnwgElnmEtPG2B8rx3F7/XLtBSAEf3fcA
 pCAg==
X-Gm-Message-State: AOAM531HxpFdpgJlwKPmZvRNi0z/xbzYlsbC2JSh1GAb8qQ4+n95hJpF
 kcfCSqQE891KigVDYO7Dizs=
X-Google-Smtp-Source: ABdhPJzPwlidgBgZfUkkvx/ngyMBO1ZskHqDqRObNcW+7+kUjWIivTeae0eRgreAxlzEleG4VVpA0g==
X-Received: by 2002:adf:c70a:: with SMTP id k10mr7770851wrg.652.1639642695315; 
 Thu, 16 Dec 2021 00:18:15 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w8sm4191877wre.106.2021.12.16.00.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 00:18:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <90fb8940-f684-f546-fd18-288af467df8d@amsat.org>
Date: Thu, 16 Dec 2021 09:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 8/9] hw/riscv: virt: Allow support for 32 cores
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
 <CAAhSdy0ruRoGvxby2Y44NwSmtPWyGqO03es-W4fegmcWa0mxJw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAAhSdy0ruRoGvxby2Y44NwSmtPWyGqO03es-W4fegmcWa0mxJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 08:18:19 -0000

On 12/16/21 06:58, Anup Patel wrote:
> On Thu, Dec 16, 2021 at 10:27 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
>>
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
>> let's set that as the maximum for the virt board.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

> IMO, we should keep QEMU VIRT_CPUS_MAX as high as
> possible to allow any kind of software Linux, OpenSBI, FreeBSD,
> Xvisor, Xen, etc. Let the guest software decide it's own limit (such
> as NR_CPUS of Linux).

Agreed.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> 
> Regards,
> Anup

