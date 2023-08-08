Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7FEC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 18:47:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTRiT-0005Ag-AX; Tue, 08 Aug 2023 14:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTRiM-0005A7-W0
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:45:55 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTRiL-00046N-5c
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:45:54 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5650ec45a7cso1018144a12.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 11:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691520351; x=1692125151; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SDMQXnmo7Lwhua0W8vmNo+e+PuS2fV7Q5sVto/Z7j04=;
 b=Yd31nixogegTBLwQgyOc67PKkk/XQPVqjfDjZNF8XIrtKYMqz+T9WIUS1CX3duoqLf
 MvX9g3JgWxztG5akBr0dQO/NsrlxEOpGYm3bVEvimD5iNYo0OnN10dDymjj1bT6pMf4E
 DWU6OYxFLIscr1xwGNPQkulTNLPhLqa79Fio3cAfzMJlXHpc8QjE2Kdzd7vrHibsPKWt
 bGlnzBfnrIuuZBkhQdhoMI1vFhNriBKqyh2zoa/ym3/i0W9AymvXQWiX2GU1xiFUnXrg
 gj5CcC2Rajz9Izv9H5YPYkvcffSpfD9eSWAmszph4NkdnRHYrW0IiYVGnY7BOtgEdJqg
 nrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691520351; x=1692125151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDMQXnmo7Lwhua0W8vmNo+e+PuS2fV7Q5sVto/Z7j04=;
 b=ajEGVtrFX4azIXh6q7uMJam3sB8gn8sHujqQG1a+rxO9wy8bR2eX/ZNfmHdk1hBJaQ
 acjdKu+y6G6+HASx9807SZWbAaUVZP431JfOo54RlZbo0UgODL0qxRbRESUvjCwOlKzz
 CnzW75sPXj/+i8+FsKq9jjF70fBQTFNp1prpT9y9nGTR4pbvXgTknfcuLM6a5fJWcDEA
 WD9dxqndgyLt3ljHU4KdGRsv/6F4C3IuguAiHgBpNqbPDaTCyD9SzAlhy0CtZwn+Pp2V
 h6tuHGQQfAgEQJ4z6U/G/1JLZFm43WPqbjqn+R3SHKBsXzvSY2RkrhxkSrCA8VMl/1Mz
 KQyA==
X-Gm-Message-State: AOJu0YyS6DMhxpRV0SkY49WM6rAIehk5rFRP1zroWTKVOU5u9lXqOmM5
 3Y0thtSSYm+HemrXRe69GR00AJD0MtN7qzhY+daK8Q==
X-Google-Smtp-Source: AGHT+IFJS63i+q7ktvcivexerivc7yDHwDZM21Ff05D+cub42h/juDePU5VumKh0ZXou6JhLx2fNUA==
X-Received: by 2002:a05:6a20:551e:b0:13c:9317:ad78 with SMTP id
 ko30-20020a056a20551e00b0013c9317ad78mr362633pzb.46.1691520351108; 
 Tue, 08 Aug 2023 11:45:51 -0700 (PDT)
Received: from [10.0.16.165] ([50.221.140.188])
 by smtp.gmail.com with ESMTPSA id
 fe23-20020a056a002f1700b006875be41637sm8622156pfb.145.2023.08.08.11.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 11:45:50 -0700 (PDT)
Message-ID: <9fceb378-f079-e9ff-b8fe-da05b51fc1e1@rivosinc.com>
Date: Tue, 8 Aug 2023 11:45:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] riscv: zicond: make non-experimental
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <0938f9c9-98a4-7238-c644-3eebd8964f87@linaro.org>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <0938f9c9-98a4-7238-c644-3eebd8964f87@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=vineetg@rivosinc.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.14, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/8/23 11:29, Richard Henderson wrote:
> On 8/8/23 11:17, Vineet Gupta wrote:
>> zicond is now codegen supported in both llvm and gcc.
>
> It is still not in
>
> https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions

Right, its been frozen since April though and with support trickling in 
rest of tooling it becomes harder to test.
I don't know what exactly QEMU's policy is on this ?

-Vineet


