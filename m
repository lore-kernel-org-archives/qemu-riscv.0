Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDU05-0001SC-LV
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 12:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU03-0001OV-8G
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:25:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU01-0008Ey-F5
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 12:25:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id ay40so28572413wmb.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 09:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3T91HwQOAnWIpRn3SvTRnOAfUKhwZ/jeHHmRfduj66s=;
 b=quMu6EnVbim77rg8p+wR/ErN2PVaJe6qBy1KNSodJi9NcQDJdhB2ABvMzqYXcvyfPn
 Zs5h7Aivn93mFTn8iHCGJOA5hf6uhT0xlc9JO7Pf2X1KX2Xv0xFKe+ZT9aBI37LU1HRK
 XxOQY0/SSkaPehewXM/yhDXZTof2aqyp4FD0NIBVhy8kSFfPewIe2gVnAsNdM2LcZfi0
 krWOZdLTMzjWUJePkf29e6gxj9PeoumBDIYhD26F/wFg4vHsSQBpnFymSyKSUbP8NBgK
 d0swAkVoEoUjWMTNeBQxeqGf9tOTtG+o7hXeQ8qU8+xaaXOzNdBOCJlw+LAszPOBwdt1
 /xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3T91HwQOAnWIpRn3SvTRnOAfUKhwZ/jeHHmRfduj66s=;
 b=6NxAJ1xaR1Y305vFQQ63LhqIo7FEE2/YsWKW/wFWcObLW+ldh1JshFzLBYr1ftjob5
 r8LWMyO39zAHo5N31Zyp7Iz96iy+ImNQzRpka/wgVv+FZRKFvLOMBTsaybp1CvwLroCI
 j4qxRfn8nR1Y019Sd7QesugFzvCUE/kzCXudWeKgeRexb7mhlMH4hHaAYhPmu9amUx+Z
 fTl9LqZ2MnJIBI6suE9a4Fjhi66bYd6lWbH+3JPzxTQX8MTNf8EQRidmcjsstbzdlWum
 wBdOlo095gg+cEAaJwqc/GadrC5lnIQEE6+ad6dzwnwRQUZsclhcbvABaoJ0PDnyQQFk
 H8Kw==
X-Gm-Message-State: AFqh2koIbXOkGIZ44jyphqVqkO9hEGpSZiPSa4axvBJUejvT1u+1BUrZ
 JYRR+kC22G4HajCzofAcx6iBww==
X-Google-Smtp-Source: AMrXdXvsHBe9d9GUMJ95WBX2h+TeF4Aisk1ydk+fuVdZmjxULJqBXMxuCgLrZGU3vG1D7A4Ueus7Hw==
X-Received: by 2002:a05:600c:4e53:b0:3c6:e60f:3f4a with SMTP id
 e19-20020a05600c4e5300b003c6e60f3f4amr35763244wmq.1.1672939552111; 
 Thu, 05 Jan 2023 09:25:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c3b0700b003cfd4cf0761sm3611995wms.1.2023.01.05.09.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:25:51 -0800 (PST)
Message-ID: <460dc896-f3bf-26ac-5c0d-95ebe1e3ecfd@linaro.org>
Date: Thu, 5 Jan 2023 18:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/21] gdbstub: specialise stub_can_reverse
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
X-List-Received-Date: Thu, 05 Jan 2023 17:25:56 -0000

On 5/1/23 17:43, Alex Bennée wrote:
> Currently we only support replay for softmmu mode so it is a constant
> false for user-mode.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  1 +
>   gdbstub/gdbstub.c   | 13 ++-----------
>   gdbstub/softmmu.c   |  5 +++++
>   gdbstub/user.c      |  5 +++++
>   4 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index a371373c1d..1def9dfc9c 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -126,6 +126,7 @@ CPUState *gdb_first_attached_cpu(void);
>   void gdb_append_thread_id(CPUState *cpu, GString *buf);
>   int gdb_get_cpu_index(CPUState *cpu);
>   unsigned int gdb_get_max_cpus(void); /* both */
> +bool gdb_stub_can_reverse(void); /* softmmu, stub for user */
Maybe without the 'stub', gdb_can_reverse()?

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


