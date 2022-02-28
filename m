Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOlJJ-0004W8-EK
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 14:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlJI-0004Uj-27
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:03:52 -0500
Received: from [2607:f8b0:4864:20::42b] (port=33563
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlJG-0006df-IL
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:03:51 -0500
Received: by mail-pf1-x42b.google.com with SMTP id d17so11905671pfl.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 11:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8r6opFxySI6bN05g8GlBRXxtdvMtXy0y4XbUq5HARDk=;
 b=GdXSdazlYqbrrC43gMFYVBn3Qh/iO4h4Wf1iCV7ogqmjZtok19gjyjU7z6RM2FRxtz
 /rZevSqpb3XQKiSkvfjXaNszBo2+Du4qFdaJ9Gfikj5kU2C9hR4YHnvcTS9xsQqtXje5
 QjYOIqDZaQkGAVuU5wXT5k81IBd20BykR7POts8PwO8QsxqReIb7qjSiUOP8O3Wp5Jon
 +g9LjBjWGe/pzwxDndQFwwfA4N0PrPCVMJrNeOfJOfftakCwZRLCAxNIjguM+/jzrbMT
 vqaNoYLD0UnFNDsRSF1D17eun94ZAWlWviJZ8bqpgJDFcSzIHI6p5uOOQJxPWslAdAhy
 +A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8r6opFxySI6bN05g8GlBRXxtdvMtXy0y4XbUq5HARDk=;
 b=y8SWgfi5MerNmulhU0VECS7AcCBk3hcfpiiJ2QENNiufKkk7uVOK5EqsxKj5vcFLa0
 ggbTpjRh0foc0fhiYm5sVhGKPFjzizFSHFMJipaTUMaP497VGg6mQsVMqiiW3h7GVOTP
 CsuY0YMpec15dD/ehbqII3yk3+g1Avp52fJ3M0ISzM9l7sdPH9BFB0XFg5jVakY80iZ5
 GG//UD6fl0t/EPC/pDL9mjF7CIozsprr0MUaGyEUE+FJ2cAnpEa7MAPz6Hbu5cG6/wlg
 8YnnkZtG431IX72E/jYiutTkUTEToXGKQQgu8hk4XmU8AuvPa5EZuUMqGc0YD1vxiMfR
 9x4Q==
X-Gm-Message-State: AOAM533g0E4TSiVNguYv5DZA0qF05iYG+m2I0wlavCJVz92Nihe++znQ
 oYu21xyxsOZUJxgUWYOR3BOiWQ==
X-Google-Smtp-Source: ABdhPJzNBOdtjf25FDHz09mq4J/DQY3u7zg44kDA8jLKtJ74bWhiOZPgya7TJm0zmr3d45oT3TlNAQ==
X-Received: by 2002:a05:6a00:1f9b:b0:4f4:1c0b:7102 with SMTP id
 bg27-20020a056a001f9b00b004f41c0b7102mr3040668pfb.62.1646075029186; 
 Mon, 28 Feb 2022 11:03:49 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a056a00148a00b004e0f420dd90sm14230929pfu.40.2022.02.28.11.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:03:48 -0800 (PST)
Message-ID: <6400b0a1-4d11-506c-426c-5d80ae871d7b@linaro.org>
Date: Mon, 28 Feb 2022 09:03:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 08/14] target/riscv: rvk: add support for sha256
 related instructions in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-9-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-9-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 19:03:52 -0000

On 2/28/22 04:48, Weiwei Li wrote:
>   - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions
> 
> Co-authored-by: Zewen Ye<lustrew@foxmail.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn32.decode              |  5 ++++
>   target/riscv/insn_trans/trans_rvk.c.inc | 37 +++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

