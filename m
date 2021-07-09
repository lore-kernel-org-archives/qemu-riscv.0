Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1ktl-0007sb-BQ
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 03:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ktj-0007ok-T8; Fri, 09 Jul 2021 03:26:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1kti-0004H8-Fa; Fri, 09 Jul 2021 03:26:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id j34so5669523wms.5;
 Fri, 09 Jul 2021 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C+ZUAE2bIJAtQiztav0gIg9627CA5ryf/j64GvnnBjI=;
 b=tkX3gOrGMX/Ice12zINwL1ppCyCCzs+0mviEd4pBx8XpjDRKFQwD5nNlOy/xE8FqaC
 c+rLAfs1k+vDRK0Wh1QJpB9m8CI3DfvlUetskwqvGV8lGI3dRjQ8mKN8+HT5fkBDsTB4
 7uRMJIoI4CKQjoOX1thfuldLfMgstOQPbZE0Ap+9nybzXIqNlBHQpfM5vrg9VmZ/aQx3
 feFL7g0Mkc7LGiPwkFLVR3nUgWZE2oCDTqb74ND943qgv78FyNxFYYxHDNMUId5xTrws
 XDWI41IMAUwa5G1H3ptMhCNB5n4qluR3CuvzXY8qgaw7/colfDq1XF3Db0k85fcnZZS8
 8UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C+ZUAE2bIJAtQiztav0gIg9627CA5ryf/j64GvnnBjI=;
 b=L69OW7AGlIblsNqMG8xX3bWSTgiWGxDzGgFL/WUbtHGcNcjYprP3qXc6LItNgURmZE
 kBkQF7bsdoiByeI4/ln9XPDvO4oBCPmQKYvVhDqG8V4/flUDB05TXLx1Hq8tz0QtTJmN
 a5Rf49Ik+MG9oYvvVedDq28f/oQpyyg8ywDcx8rrdqEGXPAJ6lumua3669hmNwYqUOrt
 7hO5FUTOYgQ0s/xkzRGsLczH2pUAYs3IQueIHfSwbzE1cCN5PTfIQpAmOMEFzcfM5Wi/
 /3NasbHS1iejO2ICYk3ntLh/bP+Cd1ZO7fgqEY1U6z20CI8OvpmALJwv0FWbVRrIVPT2
 JneA==
X-Gm-Message-State: AOAM530xfAgNHRe0aktnykcAYJ8tz0TA6qxbJ/0dijhTtkoYe4jxj2GB
 xvT3Yoc/o8KjZPyt0X5BkN8=
X-Google-Smtp-Source: ABdhPJy/OGSL+Zjuf3i9ODUzP6RzgjXY7LuUhP/1C5nNAUECBszaQE9IIlgB3h/avky3xYC0RQBRZw==
X-Received: by 2002:a1c:4e18:: with SMTP id g24mr38113139wmh.147.1625815563961; 
 Fri, 09 Jul 2021 00:26:03 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h15sm4385302wrq.88.2021.07.09.00.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:26:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <19ae939f-46a8-6f18-ce61-08de529eaacf@amsat.org>
Date: Fri, 9 Jul 2021 09:26:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 07:26:08 -0000

On 7/9/21 5:31 AM, Alistair Francis wrote:
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the external MIP bits.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/intc/ibex_plic.h |  2 ++
>  hw/intc/ibex_plic.c         | 19 +++++++++----------
>  hw/riscv/opentitan.c        |  8 ++++++++
>  3 files changed, 19 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

