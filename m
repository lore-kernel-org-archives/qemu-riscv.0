Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1hFS-00073B-My
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 22:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1hFR-00072e-Mt; Mon, 18 Jan 2021 22:00:01 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1hFQ-00072a-4g; Mon, 18 Jan 2021 22:00:01 -0500
Received: by mail-ed1-x529.google.com with SMTP id h16so19787487edt.7;
 Mon, 18 Jan 2021 18:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T8wm/6JewwPSAZFKnY3eY8zLspOVr+SJQp4TWRZ/bTk=;
 b=BGOA5xQqwWiUTVnWwJzwY2xm3cwNlGL+S0Ybgrw5ULM9ylvyYjO8iJyyOR+JtlsUqC
 7Svjfo44oOJyoDpmhLura6+KSglwSkgYWGHnneV+vYeaPVfu6E0zEv3a8Xjy1fjpTQcR
 bD6VjyVPwcDW6UdVRHekDl9iCV3VPzuV1hruqBFQ+H95N6zS8YUV4fkCuwNBXvxSdXRr
 laxvKKcV29Lp5sMmV6Pyv1M2M+zVKEGIKR1kTq096BrA9bNuj6a1QTEc+8AVRzQBqZ7b
 aJYbs+AKlQFGe7e0DhOKdIrbCssFhqJkun7+A5c0w5yXRAQC5BmEtAEMyft1+o+ONxXb
 YGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T8wm/6JewwPSAZFKnY3eY8zLspOVr+SJQp4TWRZ/bTk=;
 b=fLelj6xs2QlLZXscGyBvfFzQLJ2GLsjEJLM6gKN/zV0ZCTXyBeDcDqJrL1kuZ1PO7h
 +Pxyf+OcmsKS88lFY0M/sANOwFheKlQyTdc4aYBE3SDJzEzn5eQ5yJ3tjB6dezcbG9rH
 4/rXwX09l3NKzQK5t/bGwzkFwQ/3R6WoPt3fX0Pzuv4LBway3AxuXtgFnV40VH2lWjnp
 nGa4AtzeT2TmeudCnnS/WvbKWGoeEo92dL9KX+FBP8/+w7Tw4tRSb7M18CsuQiQ7gF30
 0sd8I+5Qy6Ym/kv1HnhZBUZG9uN/ZPEeaLagfVozZ9RzRd6Y4Dr7Oqf0Z+fiEZU/TvxJ
 OjPw==
X-Gm-Message-State: AOAM530JhRfPGxxOFdpXmjLGZEHoOsJfh7EaiYGjmgXfBej8J/WYI5mf
 YbyUaq+nSbp95UmaqsahXaprvqUhi3k=
X-Google-Smtp-Source: ABdhPJypAxeLXTUxWzXbtthO6gsQSRn2F+wiiJ3Q5eWaZFou+mro/rTyNki2rd3D0ypbnq9V8s1hEA==
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr1766613edt.21.1611025197458;
 Mon, 18 Jan 2021 18:59:57 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id ar1sm7336994ejc.30.2021.01.18.18.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 18:59:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] target/riscv: Declare csr_ops[] with a known size
To: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15b229b9-d8c3-5e98-18ca-8c2953c19d54@amsat.org>
Date: Tue, 19 Jan 2021 03:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 19 Jan 2021 03:00:02 -0000

On 1/19/21 3:52 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> csr_ops[] is currently declared with an unknown size in cpu.h.
> Since the array size is known, let's do a complete declaration.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

