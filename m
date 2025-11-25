Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA080CFD368
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 06:23:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNmSg-0003Pt-Oa; Tue, 25 Nov 2025 01:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmSe-0003Ou-DE
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:23:36 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmSb-0003PU-OK
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:23:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso24215485e9.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Nov 2025 22:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764051812; x=1764656612; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UOOQl3kZW1bVC+fk7t2YWU1R6hWEB46Dmnal7magMFw=;
 b=QmKlvv7Q+Zu8djKPc5aBr4sGJ36pXkr4GUGOLbCwK20Xr07aGaUSNpKejYxOsko7i8
 jwAdMQKWjP677IKMVyJTBQBBwLKuOvtEDf/aIpBvmUfr9t+gK1WE6BXsdU0tU8bn49Mo
 h3Ja4tLNUQ37/yHEV2AI6hthUo1nL5khlNwrBXNFo7q9HOyo5nYC8kkkyE++04o7+5qj
 +jCsxBZ/3h6rg50tSs1Y3uwRaBZ0o+21o58RikD7MQ36N1YyLHMwbYnxDqT0GB0oea3j
 4Kw4oWV51hWGgfnp8hRPr7jLyPz+5cNKEStMD7u9ojOYZAjDfvto3j4z5wwXG87f/Q8g
 MUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764051812; x=1764656612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UOOQl3kZW1bVC+fk7t2YWU1R6hWEB46Dmnal7magMFw=;
 b=YV++gO0D05UVqMyj+J5clZtRAh1UIMuwbRkgyqUChZlfDorXFFWEdWkzNlTVRSvmIP
 BiiNYzdpqJF1ULpLnNxzRZ+rGaE6Z3sbxg0v7rNNttVBh1Ok9+CHM++C/APOJb8vbN8l
 rBXGLp/jo2xIKWKzrZ58qUrfhwMSi6+Ag4cWcDwC2t36FYJWdI/w1QytyIXX9bptmB2R
 bqAJN/5V2hWsTBdU5bu4k4IbQG5Zmd7qbIiUKA3VuEXsjiB+XLkzixt1Nq0VH81v+kqX
 f2K2o8QgwrBhx5BiIBYLtyT+qq7o1r27VibQi1Mb4dhy0YTSJswxJ51/cfT+YjQYc1gx
 fK7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWosskk0F9pF7Nusjy/M63hYnDEtnRrTnFyXJePfk8AYeqGMMFSF+bnQL0jKzwPLW8yyDPuLiyy23x5@nongnu.org
X-Gm-Message-State: AOJu0YwZXTJdc90IPMU6QOq80hM9/g+Si8bifFxxvVOlHVaIHKr780Bn
 z0VIdIs7NYY3J5eE+lqQiMK9HPLB12L19zYzbjpQimqJnihHkqx4wf4E1brTTtEOKDA=
X-Gm-Gg: ASbGncvtvXbxdjM8SEVjyd8AUVx6FhOsoA2FmE03IRd90aX7PxI8H9zWKTr2oQgKZxn
 EXfDsu45o1mxkoNx9agA6nfOamvxTE2FmAj+7GBcW4VaUoFYyYvjCTAhoVKQqV41FvsLWSP4mQY
 0yXToMuZ1UcgE2pqHQJK3/17TFTVV8XbHy6Aofm26sRtfDOa62lgCKhZRytAY9tXTx3g+8xRJyS
 7TQbzSf+hpDTsp9b8ADssWkfbpBqI4m0wfY3UF0r+7VaUYygZt/1DJIZdu0E66NoJJtOgfrsUzb
 s+gBfduSttu6f8SVl+ffrRrjIZ7ZcD4SglGU2gYmqJERnxhrit1qswTto9N6k9k6CX0A6fKbFW0
 2tnavKFvhQGI5sGOO3R95AiBBuG4CsR5mIRoPAoAkq6flfXorK7PcaHCt7LNXa/wDpWV1gRvJHA
 hrEHB/ThKYNQdAUB9hdBxzrqsrLaJnx4VeAN1/3gnVvWTlD9P96bbz2ZR3BtilWXfA
X-Google-Smtp-Source: AGHT+IGLa5fRK9K5L3FkUn0xfaMF4zkOQClpsNtdNtMutakIaGVpTMJc0y08tQVlCwv9gBeMm+157Q==
X-Received: by 2002:a05:600c:3543:b0:477:1ae1:fa5d with SMTP id
 5b1f17b1804b1-477c1142268mr112956985e9.20.1764051811939; 
 Mon, 24 Nov 2025 22:23:31 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf226c2asm231059685e9.10.2025.11.24.22.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:23:31 -0800 (PST)
Message-ID: <541f756c-0fde-488b-b386-814fb276ebae@linaro.org>
Date: Tue, 25 Nov 2025 07:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] error: Use error_setg_errno() for simplicity and
 consistency
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 21/11/25 13:14, Markus Armbruster wrote:
> Use error_setg_errno() instead of passing the value of strerror() or
> g_strerror() to error_setg().
> 
> The separator between the error message proper and the value of
> strerror() changes from " : ", "", " - ", "- " to ": " in places.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   backends/spdm-socket.c      |  4 ++--
>   backends/tpm/tpm_emulator.c | 13 +++++--------
>   hw/9pfs/9p.c                |  3 +--
>   hw/acpi/core.c              |  3 +--
>   hw/intc/openpic_kvm.c       |  3 +--
>   hw/intc/xics_kvm.c          |  5 +++--
>   hw/remote/vfio-user-obj.c   | 18 +++++++++---------
>   hw/sensor/emc141x.c         |  4 ++--
>   hw/sensor/tmp421.c          |  4 ++--
>   hw/smbios/smbios.c          |  4 ++--
>   hw/virtio/vdpa-dev.c        |  4 ++--
>   migration/postcopy-ram.c    | 10 +++++-----
>   net/slirp.c                 |  5 +++--
>   qga/commands-posix-ssh.c    | 23 +++++++++++++----------
>   system/vl.c                 |  2 +-
>   target/ppc/kvm.c            |  5 ++---
>   16 files changed, 54 insertions(+), 56 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


