Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZewR-00080t-1a
	for mharc-qemu-riscv@gnu.org; Sat, 17 Sep 2022 17:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZewO-0007zJ-H6; Sat, 17 Sep 2022 17:01:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZewM-0002FY-Br; Sat, 17 Sep 2022 17:01:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id t7so41261595wrm.10;
 Sat, 17 Sep 2022 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=w7xTVhlI5Nrzm5S0kcED8NIpVXGbD6GOzLBq9b/ay9o=;
 b=iCOHIKy8w+BYRNVJ/UiG486nqlGh1jw7jlPxZ7/0QBW8hBxD0DaX7xervVaFXHAkqi
 otaAcGiR2jzi07sfX0Ns/pX263ddWrQ9cdjpkPHBbutWa9cq90+DCplbnBYjhIvML/Ym
 OWFt9nA9vppJ4X50RbocKK63RuTPyHkdjtfpiH6xnetgR0XTKEFAAkvoCmMADFKTu/P3
 HCLh3NCpKn2zGn23Og2csWm1oDzdDGWgj9Lidmd3Y2IZKfWTaDK8PDvAF8R4hN/WspwU
 DjyK3yK0q0V605cohxP+T3BSrpXZtC4II2UFKXRrX0P4S5A22hykrjuQakx9bNQPee1u
 hZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=w7xTVhlI5Nrzm5S0kcED8NIpVXGbD6GOzLBq9b/ay9o=;
 b=pjdVWZsjEprem7HlpmYfewIVzyHOEPq5LDDziwsS+Hlbh5vhQbixWE89K5ZAcPnlim
 3oqc6sKFzcvRM759e9zbzmCiNA4/WlB6AWJ+n8CyAwsbaQbDy77OxgnriF1PdNoX7/bx
 e7P+zj5rAmdPRT1c7j9i6QaWymjzO19B8yub/1UnsPl9/q6dPWCFAoEhsUlKxSHsD21e
 UcMPqKq/Imd8tdmmD8OXybCsq1yhpdoNpXnV58OjWkytx/4oRXMSHq8wnW8If/XE/ttc
 3ktXJ7S5k/HqMSfG1uGhmUam5pTUoaZzzGVDWMyieCHi6gN84fTUXyRPD4Sd9Q4sSJQg
 z1xQ==
X-Gm-Message-State: ACrzQf1wtZd7eV3kg9rD7arsD8Rr2uBod8mcrfLSnUyzvhFXtm1SbjHH
 Spq5AIXFMFtggmCT/uRfrP0=
X-Google-Smtp-Source: AMsMyM71VWg6MCUOx7Z4ow77z63FaUmY/9l4T1Rxk8e/s4WwlQe0umbhmDyRiBSjDStqJnIpK4ZIaw==
X-Received: by 2002:a5d:598a:0:b0:22a:f5f9:1fa0 with SMTP id
 n10-20020a5d598a000000b0022af5f91fa0mr1290263wri.711.1663448488463; 
 Sat, 17 Sep 2022 14:01:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003b47b80cec3sm7424533wmq.42.2022.09.17.14.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:01:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <bf25d322-5b9f-9659-6d1d-174fdd934c7f@amsat.org>
Date: Sat, 17 Sep 2022 23:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] target/riscv: Set the CPU resetvec directly
Content-Language: en-US
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 bmeng.cn@gmail.com, alistair23@gmail.com
References: <20220914101108.82571-1-alistair.francis@wdc.com>
 <20220914101108.82571-2-alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220914101108.82571-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 17 Sep 2022 21:01:32 -0000

On 14/9/22 12:11, Alistair Francis via wrote:
> Instead of using our properties to set a config value which then might
> be used to set the resetvec (depending on your timing), let's instead
> just set the resetvec directly in the env struct.
> 
> This allows us to set the reset vec from the command line with:
>      -global driver=riscv.hart_array,property=resetvec,value=0x20000400
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h     |  3 +--
>   target/riscv/cpu.c     | 13 +++----------
>   target/riscv/machine.c |  6 +++---
>   3 files changed, 7 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

