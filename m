Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpmcC-0003kt-1b
	for mharc-qemu-riscv@gnu.org; Wed, 24 Nov 2021 02:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpmc9-0003f5-6G; Wed, 24 Nov 2021 02:22:45 -0500
Received: from [2a00:1450:4864:20::432] (port=46069
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpmc6-0002bZ-LD; Wed, 24 Nov 2021 02:22:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id o13so2353426wrs.12;
 Tue, 23 Nov 2021 23:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ubj9cXj5fC3VQ7pdiT3o7THkHNn5AmB3vSBoLTQAgts=;
 b=mUNZn0AAMAz/cyCE0flAqyxYdXzPr9tEH1Z5jD/F/2WA0LzN1bmcgP81Hvk45FVFwF
 lc+DMEFsRGf0rjU810c61oAvcQsxqBqgP+sYpaaSKVnW9Z8sCq/BdA2Xo3AKp52XSFlq
 TSw+cQEg713ICQfGliWqg39QXLCACST2UBBbYZVaWl26X8f2bYKtWabmGlMezPsodA2M
 ViRoigtuzhrNuVP8yojIaq+J5KbFYK4r7aIlq+/7YN5KLgzyd1FI/3Eej8xryoT9/uVx
 AFP4vuu0J+rwZ1Uw1qQuGPdXnsHljaVkvjaPKiTbRJK7TZjWEMi/Ck/q/h7N7Vzyo1xV
 Xj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ubj9cXj5fC3VQ7pdiT3o7THkHNn5AmB3vSBoLTQAgts=;
 b=GzTL0Ah38qOAGEBfK0gts6xftHGZ/HJMLA/1DNuf2ge4vmws0g89m5WE0XzAc/+n3b
 CocDm4WQMsad+HNSGL/91I1A4dLqio7eRxkELv7X1ZpPSN53Wk56Oz4RYfimma/EiEga
 hmNjuALcO5cqNq1BoSOoriQFOyBHStlEWKEDQWAuKydGTHgUtTj6gYNPy65Zho/3B/o1
 /kq/BxSwnSk3eB58buK8Xl+s2AwnZ29k0Y/rnjPoBJptAin6hOlqzAu6PqaIuar9/qnd
 bvzXDEJI+MSmE61Ey1lcqcRzUDx+E7eGwqfni2TvLlTwRfteH6KEImW4I5mmLplPTBJH
 B5hw==
X-Gm-Message-State: AOAM532+Vy/sMB4sYeiMVaHU7rYPlwrS00jdeREugUptaVFVspi2SX3k
 PfB3GSPwOo+SBIoQMccvxoU=
X-Google-Smtp-Source: ABdhPJz3PoXatm/XN41exnZRlux+uuk/AjosCn1WrxS3uN26y6bhURJ6UetPfZvScm+P1TCdNba24Q==
X-Received: by 2002:a05:6000:15c1:: with SMTP id
 y1mr16255402wry.63.1637738560926; 
 Tue, 23 Nov 2021 23:22:40 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s8sm14920441wra.9.2021.11.23.23.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:22:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <6321f941-b4cf-8c1b-cb2d-972468cc71e8@amsat.org>
Date: Wed, 24 Nov 2021 08:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 02/18] exec/memop: Adding signed quad and octo defines
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.1,
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
X-List-Received-Date: Wed, 24 Nov 2021 07:22:45 -0000

On 11/12/21 15:58, Frédéric Pétrot wrote:
> Adding defines to handle signed 64-bit and unsigned 128-bit quantities in
> memory accesses.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>  include/exec/memop.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

