Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAr86-0007bj-OT
	for mharc-qemu-riscv@gnu.org; Fri, 21 Jan 2022 05:26:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAr81-0007Y1-Vj; Fri, 21 Jan 2022 05:26:46 -0500
Received: from [2a00:1450:4864:20::331] (port=56154
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAr80-0005TY-Fl; Fri, 21 Jan 2022 05:26:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id c66so17013459wma.5;
 Fri, 21 Jan 2022 02:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/syCyXmS9StHTAiTcO93ugwIFQqtnPbdsewfIjzkOE=;
 b=Mb+qFazUVkrKkDH9S9BaAvQ3xGgijm629xT73MsyUOwrdmZWX5vP9pl/yZqK3GAsWS
 MTru0S3AiHvqxrUFWv0QcTwppyu/PK9/rB7KmK8FOkTV2PMNhmnbf8CL6iK4rSDClJoe
 HOmlVEpZAI87hYwcYCwFQtvQGb+XVzyONkbcenvtZkZKr8d3vg8mtHIhfrDoj8d9eHUi
 R3nmadYMfP4hJeLLXdV20C5LReLv1J9yLcq9RD7MK0Rguo9Py/fm94jXwOQgOIc5tPXi
 j+wp22tYX0ZC1hPfhzGraf8qvWt9TGeT7k+GIiN+tIYHIgijLF+zhdMzrHQvN08BuBd/
 vePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/syCyXmS9StHTAiTcO93ugwIFQqtnPbdsewfIjzkOE=;
 b=ViSo1hUEM5BU2eFIvy/coTGeKfWbShqsR5D8gvtZWEBIHrl+pIhBoKABlhrKZp6lXd
 DHZB7oeDuzaUJaNTNglB0joCjNC/+Spbc6GNsaFi6ydBZE/2o6vA8rreSNs1a1VfeSr/
 VIcbCvleyPxJMqvNlBLLriZtMn7FS95+HOQgp3ORnA78hrkVzRgLKec0MCr1jWElA2VH
 DHSYHxQT9UdvnCS4lIeeBsgTmRYvASqEOZdkXSvRB+ksyATUwkFeF/XTDpVQBOHRGufk
 1fb2eD+LON/wUQTkSb70aARy2n26M3Yy3CouCY5TztYzWKGe8w6PyzaehDd+opAfLXIJ
 mxMA==
X-Gm-Message-State: AOAM533f0LempDpNPT19lLmmAA2hKb3t4Yllk8I5+D5OfpQKuD9YbJp7
 JNAV/h/uiyonG8kUEf50BemxaYaGjz8=
X-Google-Smtp-Source: ABdhPJxNB2Ld28xNTVbMx+i0suP8RkyOK8BmVgF3tEDyFb1nzO5R/44PtdkyH+9PfjRzTPsC0pLuug==
X-Received: by 2002:a7b:cb18:: with SMTP id u24mr82574wmj.15.1642760802608;
 Fri, 21 Jan 2022 02:26:42 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m2sm5366435wrr.6.2022.01.21.02.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 02:26:42 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <8d476b94-66b7-6821-fb1f-2bac6878ab3d@amsat.org>
Date: Fri, 21 Jan 2022 11:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] include: hw: remove ibex_plic.h
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
References: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
X-List-Received-Date: Fri, 21 Jan 2022 10:26:48 -0000

On 1/21/22 06:50, Alistair Francis wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This patch removes the left-over/unused `ibex_plic.h` file. Previously
> used by opentitan, which now follows the RISC-V standard and uses the
> SiFivePlicState.
> 
> Fixes: 434e7e021 ("hw/intc: Remove the Ibex PLIC")
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  include/hw/intc/ibex_plic.h | 67 -------------------------------------
>  1 file changed, 67 deletions(-)
>  delete mode 100644 include/hw/intc/ibex_plic.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


