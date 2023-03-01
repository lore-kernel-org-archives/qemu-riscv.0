Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXW6w-0003ki-I6
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 18:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6o-0003iB-R8
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 18:43:44 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6k-0004xS-NH
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 18:43:41 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 16so8757290pge.11
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 15:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677714214;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=GEzmUCJmkMM7GREo/h2A9xpLp4g1Pz5LZx9y9eJpD6k=;
 b=pcKU8SsEzCHW6b09X30a02zcmTEjh+qSxlo9k+NaKfbh6Bfx+u8CzDgRXzQXjdmbHy
 jsjUuzYX5SM+XsY2t6C4CTEnedOGnkSJOodUHDmn3u3vK9m7CeL6+NnxGq6DVJ8WA73h
 DQiU1KUR//EBsHAKrJOW+95LH5z5s1xbNDlQA9HoEyqEFZ4zE4a/Y2ChT3436zvUS3Tj
 vAkyDkYL+z3T5bKf4Lj4dH5U/noTlqTMGvUfpk1BI6N4oryYVKpVCK7GCbXnkMgEKG07
 jdtdsqOL2RrUG674xKRZnNDsqerH5xfk3z0HzvApW59uG2XZXDJjdIiYgeQRvabF2CQS
 R89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677714214;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEzmUCJmkMM7GREo/h2A9xpLp4g1Pz5LZx9y9eJpD6k=;
 b=2DJuo0xq2PVeZxUY4JKm2bE1IKvyMtgmPLbNv4YOg9142nEvp5Hx9fzng1JsNCYxqw
 NZo8RQTpOP1YnEvZ8UFLjeeemWKxUMEXwLWFJEGcTZ+0sEj9+NNZH2AXo6JYShGdWz/m
 H8GRf1kjHWq7aCMZeDDhROJa4cVrBj+gikN2VWVlYX7b5yevYYUwz83J5tOq9E69erxF
 sE4PKYb7ez7B94KQcAVfVoBLKc9yCOFcRXb9DcfM3Ty06yjYRxk6hTXzt7M1JHWk7t/N
 zDZ+wa3ZQ9NaG9Id/ToeFxkolx4cCmWoqu0m5A2uDQ2obaMUB+9gpMdaECTTB7ZpO4MX
 Rkmw==
X-Gm-Message-State: AO0yUKVyuEijkx0OnGu795A3hRjTzr04qO1JeCDQzkSK0FUrfTgjVZ+0
 P1Reg+cJqnqbyAlLzwUbWXHq3A==
X-Google-Smtp-Source: AK7set8wq0zNCbhK+v563PTUbasBOaHgvi5jzv9sBPmOYz11Hzhj5eeLx6nxH8MI7jAczfrRPnWooQ==
X-Received: by 2002:aa7:8f33:0:b0:5aa:464e:8c46 with SMTP id
 y19-20020aa78f33000000b005aa464e8c46mr6720283pfr.22.1677714214289; 
 Wed, 01 Mar 2023 15:43:34 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 w3-20020aa78583000000b005abc30d9445sm8398002pfn.180.2023.03.01.15.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 15:43:33 -0800 (PST)
Date: Wed, 01 Mar 2023 15:43:33 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 15:41:02 PST (-0800)
Subject: Re: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML
 if Zicsr is disabled
In-Reply-To: <CAEUhbmWtg8+V44h7xgtggcORLww7kCv60DX+r3XYFTOrgzMtmA@mail.gmail.com>
CC: zhiwei_liu@linux.alibaba.com, bmeng@tinylab.org, qemu-devel@nongnu.org,
 liweiwei@iscas.ac.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-4de827d1-bce4-4e30-b5d3-cd9e61e4b4db@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 01 Mar 2023 23:43:44 -0000

On Wed, 01 Mar 2023 01:55:34 PST (-0800), Bin Meng wrote:
> On Wed, Mar 1, 2023 at 5:52 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>>
>>
>> On 2023/2/28 18:40, Bin Meng wrote:
>> > There is no need to generate the CSR XML if the Zicsr extension
>> > is not enabled.
>>
>> Should we generate the FPU XML or Vector XML when Zicsr is not enabled?
>
> Good point. I think we should disable that too.

Seems reasonable.  Did you want to do that as part of a v3, or just as a 
follow-on fix?

>> Zhiwei
>>
>
> Regards,
> Bin

