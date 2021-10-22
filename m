Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdrwl-0002UQ-N2
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 06:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdrwk-0002Sk-CA; Fri, 22 Oct 2021 06:38:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdrwh-0000CL-8G; Fri, 22 Oct 2021 06:38:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso2896874wmc.1; 
 Fri, 22 Oct 2021 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUt0PvwVZgqkYvenVBlUaMP7SqOZyMk91GtVPPukgq8=;
 b=QlXo6r8KTF9fDLaCcjDFxKXb/hoT5ErQj5nnayOkUTEn7OLK4rIm7IFaqMAxfnqaDE
 L+O7u7nt9YzsBkM2zBm9BY+HwuI8pofP4WmwaGK87/VtMCncCKhHyX0rIf8WZVZoEuLj
 EZ474+1nI/Oef29iRwwwSfuJ4LjxOFAUyE4kWLi3x0FwOgPI80UonYkIScFNlzwrtPDM
 jnJDNcKlH5tmINSQnZhyPlm2e0N46jEHgpTJ+LjrWDAMR0tyem9SqNO4T1pWpSuVYbXQ
 lqn5YAQIHzhU5A9h9X98Oa8lQMXh+s8W9Su0mJZZF3/O3KNGJ0YMEaKKfRAbjf76CnA4
 sQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUt0PvwVZgqkYvenVBlUaMP7SqOZyMk91GtVPPukgq8=;
 b=1uPIwDUS+YEevcw5M9gLEJ/fHyg242XytpwIQ4trJMGri+MR/v08mpD+VLqC3qhTpd
 N2l5B4bz7WQsZ0MpfLX1U0uFzJl/XJixPqxTK5pFrjDQZctTtOgfDkn/DAgSjlvHiixn
 2ksGgi6npubxl+b/XhmewItrYjaStcs5Wr+U+zv+/7O4f2j+FZNHt7zTIEUsNF5Qf7M0
 4CVfJXjfCRZbPOPfrdRtuQBUzgiU52AUc8JKVStzsx3eJgoNN8mpsYqzsxLbnU3Ntvk2
 XwiQ8AcK4LNKM07YbpRrtFSkXq2drw9mfWr5Pjhaa+BfWYUV6AW1hzw+uC37Fe8aj+7B
 ofmw==
X-Gm-Message-State: AOAM532VZtenRD8eeZeOHONryj1kafcph+AyLiTBnnvFSW3ypw8sg55X
 Ys03HEHHW6bwgYZxtScFeww=
X-Google-Smtp-Source: ABdhPJwa9f6YOlX/DaeXrqGujfFZQLV/i/PUQymG5/XZpRfHKfCIuNTrxdxUI8OQiYF1/AfncSorAQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr13375065wmc.117.1634899120893; 
 Fri, 22 Oct 2021 03:38:40 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q1sm430388wmj.20.2021.10.22.03.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 03:38:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <de9e8c6a-8850-b607-11ee-a1d54436e2e8@amsat.org>
Date: Fri, 22 Oct 2021 12:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/5] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-2.867,
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
X-List-Received-Date: Fri, 22 Oct 2021 10:38:46 -0000

On 10/22/21 08:01, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Using a macro for the PLIC configuration doesn't make the code any
> easier to read. Instead it makes it harder to figure out what is going
> on, so let's remove it.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  include/hw/riscv/virt.h | 1 -
>  hw/riscv/virt.c         | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

No cover letter, so using the first patch.

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

