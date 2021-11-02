Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhy1Q-0006WJ-IO
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 13:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhy1K-0006Rz-HV
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 13:56:30 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhy1I-0006h3-SY
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 13:56:26 -0400
Received: by mail-qt1-x832.google.com with SMTP id h14so15367qtb.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uPRTxKNCAof5pkoauqCmrFQFol4sBSMUrfjAOsKk1yg=;
 b=s8UVJKR/WAsgsWSKOPKe4Jxe1adJQh1hxSFI8XWtv96ZgEYScKp0b7pcoOfXP4oF43
 eyuw3zDzkJ0CLQB6dRJu7u/4JStmJ9HCny0ZGg4YowPAWxR98014JZr6xBCJOfHbMuWF
 VEpCCtuN7Oz1ZT3vmeD9GTvBCSRcou31fji1ytqzDYks/ltolrQvaAuIGl+nKIY6lFFM
 3PA1fpDWosDHJArCOcQlju59KqWsp75a+EJeWiu9MqsmVH8VCLYxGhU+88E2xeJM/pNG
 xtKVxh3jujKzSjhpQwXLg/+W6W2K541dKCtUR1ddOX1z3Zblww+b3sOMF1PxypeTvxre
 +ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uPRTxKNCAof5pkoauqCmrFQFol4sBSMUrfjAOsKk1yg=;
 b=PZlkR662PYRpCpGJxdyLh3fWqSkNNX3YNs0HXSI8MuIVl+ooXKEBJaNTtQ14vigwFi
 DZTf6SeB4rnt6+lgMv5RzjPTXlnAneHoiPt3PafH32P2VKOD2654yB2vTLDG2c2t/JbB
 O8sknJw/7CYfu1msD4hIRpdKwfzlWTyqRltVr/o1Br0O1raONsvuaX1DUc+zDomkJSsC
 OUsNCC/YQ/TAyVdVpjcCzsqx78A6nhqeG13ZMO8Hyg5D8IkMYy1BtkUa3NzI3cr4Oo9d
 vXiQP+/VI0F0ZpDFenucvNNcaO+R+2ti6Xqhsebs3b9WfB+aiM/R5v39ZJlp2cAfhgdu
 hlVw==
X-Gm-Message-State: AOAM5323xqCLwyWyzm5BK0ihEJCE9U139vGx5GoQRjP1LC2WCCkRCS9s
 myWEj33lj8sNUpX6Ha7z5RZbQA==
X-Google-Smtp-Source: ABdhPJy64sdIXhQ42orOuznS5g4uCrG6YBKwVA22MneaI3zZQkYnl4LSmJjW/FJA+RjxqvZMu7sW9w==
X-Received: by 2002:a05:622a:19a5:: with SMTP id
 u37mr17136402qtc.10.1635875783783; 
 Tue, 02 Nov 2021 10:56:23 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id k16sm8807046qkj.70.2021.11.02.10.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:56:23 -0700 (PDT)
Subject: Re: [RFC 3/6] target/riscv: rvk: add flag support for
 Zk/Zkn/Zknd/Zknd/Zkne/Zknh/Zks/Zksed/Zksh/Zkr
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85f8f249-a54c-0ad6-a3bf-7bc4f072251b@linaro.org>
Date: Tue, 2 Nov 2021 13:56:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102031128.17296-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Tue, 02 Nov 2021 17:56:30 -0000

On 11/1/21 11:11 PM, liweiwei wrote:
> +        if (cpu->cfg.ext_zk) {
> +            cpu->cfg.ext_zbkb = true;
> +            cpu->cfg.ext_zbkc = true;
> +            cpu->cfg.ext_zbkx = true;
> +            cpu->cfg.ext_zknd = true;
> +            cpu->cfg.ext_zkne = true;
> +            cpu->cfg.ext_zknh = true;
> +            cpu->cfg.ext_zkr = true;
> +        }

Section 2.12 lists instead the larger Zkn, Zks, Zkt extensions.
I think it's better to follow that.


r~

