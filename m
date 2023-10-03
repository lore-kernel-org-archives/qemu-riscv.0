Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F92E7AD43
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 13:26:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnfP6-0005vb-9t; Tue, 03 Oct 2023 09:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnfP4-0005rH-96
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 09:25:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnfP2-0003DV-F8
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 09:25:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405361bb94eso9553815e9.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696339530; x=1696944330; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b9EKo/m7U4EHVQlsRnB/t3McfyOJ+8zxrsmJXyTxX70=;
 b=Wc/RmjVTh48Wl4lQt4zqVOuuVryu82iiPHhO5bS/3qhkxmdvl4kC2Zd51JDHzZSZZC
 ySJnitXKyr8aCxm83pCV0osyDROZQ9nbdStTQYhV6MuQ47MM+UpaouHXKE4pobNBGOkJ
 zHRv0+kdau8QkVIwjiUoiDxBzf3u4WnY3xP3XgbZR793u32P/FMDgUXYI5RhMrs4L1PL
 lOJqBXdOOd3tvhTGcIt3DeF/vqeUL/oOkbpfqubj0WvkUABogT1gmw6R1SYZFbDuZ6jb
 fiuqiQzJyO3evp26Udkn6cwhYS0hmShgZC+T1lp89iKpxUNyGBI6ZlZaflbJ8ZL0yDeK
 QL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696339530; x=1696944330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b9EKo/m7U4EHVQlsRnB/t3McfyOJ+8zxrsmJXyTxX70=;
 b=DNbBHXs8pq5Za+JkxMHStWXfbFW+SSYf9+2K7HGyeYiu5c/cIItUsNvAdWmhcB0HLa
 T6gwC1WMM5Lf02gOWs9X+s+uXDfflBlxKC7W0pj7UELZvNuV6geKe+/yBsplS2CYi/GH
 4zwKhpK9+Xqp5BHRfnO9cyaKUBf953xfDkjCyZnR1q9r7OdNiKzhc4D5xv/J9/dM40N9
 ygIDHslp1csEt9qm/EaMY9YcWCU1DuAVSMlQfzcXDteOihpXBuFndx9nVM5eC0483udC
 jdwB3OqZCn7Kyfb7cuzcG3xAX83tyGT7QipW4/gVpLtBb+/UrY2WZ24l9uGZZ/V+kJB7
 c+fQ==
X-Gm-Message-State: AOJu0YzILYvZUNd1/AmY/odbFRm0ZVvkbMdXNm3kguyuKLpWs9TkBBkd
 GOWoBtcvKG6XF3cgGEOaWD9JQ0QM0+cUHnVGZGQ+KA==
X-Google-Smtp-Source: AGHT+IFq/np3a3QICu6ak5G3P5O6TsQtDP1Ui3Jjchdu4E6/uG3kG2vWCTAI7mo7T11KJC8rkguQaQ==
X-Received: by 2002:a7b:ce16:0:b0:406:4501:9095 with SMTP id
 m22-20020a7bce16000000b0040645019095mr13747249wmc.40.1696339530534; 
 Tue, 03 Oct 2023 06:25:30 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-246.abo.bbox.fr.
 [176.131.222.246]) by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b004064e3b94afsm9480975wmk.4.2023.10.03.06.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 06:25:29 -0700 (PDT)
Message-ID: <d6bd1212-5613-28a4-1cf2-ef5208a4c434@linaro.org>
Date: Tue, 3 Oct 2023 15:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] target/riscv/kvm: improve 'init_multiext_cfg'
 error msg
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231003132148.797921-1-dbarboza@ventanamicro.com>
 <20231003132148.797921-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231003132148.797921-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 3/10/23 15:21, Daniel Henrique Barboza wrote:
> Our error message is returning the value of 'ret', which will be always
> -1 in case of error, and will not be that useful:
> 
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1
> 
> Improve the error message by outputting 'errno' instead of 'ret'. Use
> strerrorname_np() to output the error name instead of the error code.
> This will give us what we need to know right away:
> 
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error code: ENOENT
> 
> Given that we're going to exit(1) in this condition instead of
> attempting to recover, remove the 'kvm_riscv_destroy_scratch_vcpu()'
> call.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/kvm/kvm-cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


