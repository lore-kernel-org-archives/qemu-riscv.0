Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1Fxg-0001Uh-NY
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 17:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Fxf-0001Tb-7P
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:19:35 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Fxa-0002sJ-W4
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:19:34 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q17so15332419pls.9
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23r4fX3J/weMbscRcBh61GGNv2dX/n/E8WdGFG//fyo=;
 b=Z0mAg1cc0bS+vq1NyJLhFRClQg4aS2YAeFsOXHZO1VDPj/iktToRr9DlLeacVmJ2m6
 n/lXX6wY+2kXIESo1UOkF8jf4lj/RSqgTgsW2qlAP82HcGeey0QlbYR9BpbakP+IupLw
 N8qmCUbeOeZ1/nNOYC5nMlNPrwv+uQ3mAYDnZbJNZB4CCOsVkLLLBSlC/uvHGdxUeL0q
 XlSlFYtUW4mYT7a+z1/kyQeu26LX3XSvHp746euoXwtT/KMBz7DyzJSvPxpYCJ+0GCJp
 H8SncEBjG8daifR+C9a205kxFi/7LjiNq+PSbZw0vftkcwT6O0gS+pAsb5utqbAf4B/j
 5+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23r4fX3J/weMbscRcBh61GGNv2dX/n/E8WdGFG//fyo=;
 b=rpP+KDhW+UsSVf9iX3/jE1dNpeKnduh4D3IRQIcS5dYbdbLwlv5eKYiSBaLSCM+dHp
 Utc6Qa+TIWm2P/eBqsalHBT5HbQnZcQs8i8grZz5vX+ackqP24OI8IpO2jWRugRO0UZp
 3gvAAq3s/sNSgHHbkuGAw9mhNozJraCdv4q1f6Vp7jlbbpxXlSkZBBKXx4XgZpYK5rZN
 5UrV5NY1+EJCbc1lWdMMpRDY+CpwfyJpsYiax4HZlvT+1lKY9V+Fr7mnDcStK3cViAVr
 N2XA2Z+bwd/SshvDRbd/+GFrK1DxgkeJxjR4stYIucO9Rvu5FdTSmivhIA14ZHkXjmfI
 T3bw==
X-Gm-Message-State: AOAM531OXVQqq/Z8JKAGa7Eu+Nd0ID/wj+GAp85p/m2r/jR7BvD54ugZ
 HcAY/3XkqSBpGa+FNJe6VnghIg==
X-Google-Smtp-Source: ABdhPJxebWj5DMiCcwbHsnGAH6daIdP1ryWv+AdO83cJw/TlNFcsYHMIJIQ6KdJic6EedoVjoB90OQ==
X-Received: by 2002:a17:90b:2350:: with SMTP id
 ms16mr994415pjb.127.1596143969277; 
 Thu, 30 Jul 2020 14:19:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id cv3sm6674307pjb.45.2020.07.30.14.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 14:19:28 -0700 (PDT)
Subject: Re: [RFC v2 49/76] target/riscv: rvv-0.9: quad-widening integer
 multiply-add instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-50-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d2e0fb3-f616-7e4f-efd5-0f607644d5eb@linaro.org>
Date: Thu, 30 Jul 2020 14:19:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-50-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jul 2020 21:19:35 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vqmaccu.vv
> * vqmaccu.vx
> * vqmacc.vv
> * vqmacc.vx
> * vqmaccsu.vv
> * vqmaccsu.vx
> * vqmaccus.vx
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  15 ++++
>  target/riscv/insn32.decode              |   7 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 101 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            |  40 ++++++++++
>  4 files changed, 163 insertions(+)

Looks ok.  I presume you'll add the Zvqmac test now that's in the draft?


r~

