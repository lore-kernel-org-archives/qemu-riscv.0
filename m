Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18Ni-0001lu-Vw
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18Nh-0001lg-JR
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:13:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18Nf-0004T9-Oa
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:13:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id bh1so978539plb.12
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C4UeUkrlVs7jXp2utXIJQJa4ULIcanoqKLmny+J/qc8=;
 b=bt2EO4GDj6Uc905+EhorNxApY+B3Q8rbga/C+4mxnPXYcXqtEalkDiLa4fJz72x6GP
 81YT8eh8WnOPXE4wpsC5SNq0JM3zRLJ5W7zP46T4OMcqlla4xthuLX8QlMnBZuDn4upr
 9CONTNCtAnrwcpLhklMe26MKhufWmPFNVze5vW0Df797/Ra0EGFsmRXWYzWGsRzfJFUF
 BCu/XifEhFL9zkAkPAnmgDEnFtVrbKjDbfFXUJp1wUc79OL6zmr+lawtz9reQ+o3LLFj
 1bOdFXuJz8VvNxJQuXkfY0Cs/gNX37zF+MqqBeRUzJ7VjGjg3BZhzXW8hCv+Rvb0nqlG
 tltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C4UeUkrlVs7jXp2utXIJQJa4ULIcanoqKLmny+J/qc8=;
 b=SBnG6JeGBnfkvEV0rAWA/30ERpVxvhXxUHFNWSYUJ6w8FLzW7LZH0udMuhz9YHcdQF
 /UKQqzs9mDgRp4mBOORzf/PfPEcmZnXBWXuQAOjc+jTjxYcuXODkdqTI4XTFcno1MKHg
 OE2FMjbTIdVowyXGiC1WpmVLNx9Nr9sFGSsyjsLlzfZPZORa5d1PbLTfJ4ETFDWK87iu
 XiMNbbFpda9AGwp7n2ggXRpG20mZu5M8UJQal05FK3x1quGJGMuaspxhSg9joPTm8gB+
 +CUeHy9tsb0TM8tGqtDGckZQm7jKMqp+vG4PvuwHDF6VhTfHSP/rKmVZOCsvo2Tot0ir
 OXkw==
X-Gm-Message-State: AOAM533QYxFb15WjTTr8uciyzrovXbQFRkcTDOfZt7co/2cgOFozqggK
 MoyOHwoQz3EG5sNmjyYgJAo6gw==
X-Google-Smtp-Source: ABdhPJxGm8Q5XZ8pi9B4EnENrH2jqoy6xdQ+Ww5nzu6pdgAHU0D1a8QxhUuBOLCTs/LBNV5M4BUzDg==
X-Received: by 2002:a17:90b:4b82:: with SMTP id
 lr2mr3226996pjb.126.1596114834279; 
 Thu, 30 Jul 2020 06:13:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x20sm2863184pgc.49.2020.07.30.06.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:13:53 -0700 (PDT)
Subject: Re: [RFC v2 33/76] target/riscv: rvv-0.9: find-first-set mask bit
 instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-34-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42945a77-6fac-dd58-17ae-cf49802cee04@linaro.org>
Date: Thu, 30 Jul 2020 06:13:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-34-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 13:13:57 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 2 +-
>  target/riscv/insn32.decode              | 2 +-
>  target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
>  target/riscv/vector_helper.c            | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

