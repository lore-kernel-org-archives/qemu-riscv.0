Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB558C48BEB
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 10:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ravl3-0006vL-7B; Fri, 16 Feb 2024 05:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ravl2-0006v2-19
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 05:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ravl0-0006NT-Fu
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 05:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708080468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2eyk6FUh6FdEWzMoTjkZIIKhXTRzNxjdaI+ZyxDfbfQ=;
 b=UR+WDleq98SUenrbqkEScWXbH9qXQI6Zbpx5gdYd6M+xK2qkaPhycK+1Om18LofYi4kbP/
 Vz9X2jXIiG+IAGNDhYvtd2GDsHYowOzOXGWqmN5TKC4+P0gEWpjxVpxgNtPVgoLaAOhZ7S
 oyPAS7Ob+ksiGiyjvogzT2hT7eBvyDE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-pzOaR1MJNOWISyTDQg9rgg-1; Fri, 16 Feb 2024 05:47:47 -0500
X-MC-Unique: pzOaR1MJNOWISyTDQg9rgg-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7872ef032c6so320690685a.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 02:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708080466; x=1708685266;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2eyk6FUh6FdEWzMoTjkZIIKhXTRzNxjdaI+ZyxDfbfQ=;
 b=wy4tlLLujt+BUjMLcu0zK0ALFgSHQ3/CiafEj57/DcJFhln0KfxrdTTz5FflSyKANt
 f6ECjQTqfskI1O9PeDwSDRSpSVUAUqqcGVGj2yAhXosqsc7mo02sMLpDC8ZlYFgrXOvh
 Wabf0wmP1buBO6TbB79JVnMG1Jef+DEoQTRG4x9irge8Tqa2r1Wdu/EaFQfa65qiUjBd
 ObWbbP/l1+l9/Rc+Spf0iHd00AvLtKXSyouZYGQsNMbBIYX3Mj3zihSiZDfhk+OcSI0y
 qLQPSAZYc6+QgYmsrRhn7fr1KYdPYnXxPnAyIqmuWAa23T6rahv6c4n+nyhMqeaYjRVd
 JgKw==
X-Gm-Message-State: AOJu0YxkFgaA4MECmKTXjNNTySemrOXRCCYhUwWQLBcqhhpRIvkTz734
 3rc/FkWeY5l2L0ho+4buGQmC4Fl2tkqXVkGROXVMdD5fSdvPwAsqO78yKV5cWzIy71JbK7MBsNf
 fOWXZ6jyut+vQWLKYM9/t01Gyd8ff5Ce9SgpiJmc06KCfv/qvisbe
X-Received: by 2002:a05:620a:562d:b0:785:b189:d486 with SMTP id
 vv13-20020a05620a562d00b00785b189d486mr13711646qkn.17.1708080466642; 
 Fri, 16 Feb 2024 02:47:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/ave/c+YNb/A1KKW32NCUtCkTnHj9nQIwYEcAyuqXm8S2xi4mnB8UjHeYq5x6vYCUd8CpJg==
X-Received: by 2002:a05:620a:562d:b0:785:b189:d486 with SMTP id
 vv13-20020a05620a562d00b00785b189d486mr13711620qkn.17.1708080466376; 
 Fri, 16 Feb 2024 02:47:46 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-178.web.vodafone.de.
 [109.43.177.178]) by smtp.gmail.com with ESMTPSA id
 u10-20020ae9c00a000000b00787214b33fdsm1398844qkk.128.2024.02.16.02.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:47:45 -0800 (PST)
Message-ID: <271ef7a1-aeff-4edd-bd2f-38586399530b@redhat.com>
Date: Fri, 16 Feb 2024 11:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] libqos/virtio.c: fix 'avail_event' offset in
 qvring_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 lvivier@redhat.com, pbonzini@redhat.com, ajones@ventanamicro.com,
 alex.bennee@linaro.org
References: <20240213191736.733334-1-dbarboza@ventanamicro.com>
 <20240213191736.733334-3-dbarboza@ventanamicro.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240213191736.733334-3-dbarboza@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.772,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 13/02/2024 20.17, Daniel Henrique Barboza wrote:
> In qvring_init() we're writing vq->used->avail_event at "vq->used + 2 +
> array_size".  The struct pointed by vq->used is, from virtio_ring.h
> Linux header):
> 
>   *	// A ring of used descriptor heads with free-running index.
>   *	__virtio16 used_flags;
>   *	__virtio16 used_idx;
>   *	struct vring_used_elem used[num];
>   *	__virtio16 avail_event_idx;
> 
> So 'flags' is the word right at vq->used. 'idx' is vq->used + 2. We need
> to skip 'used_idx' by adding + 2 bytes, and then sum the vector size, to
> reach avail_event_idx. An example on how to properly access this field
> can be found in qvirtqueue_kick():
> 
> avail_event = qvirtio_readw(d, qts, vq->used + 4 +
>                              sizeof(struct vring_used_elem) * vq->size);
> 
> This error was detected when enabling the RISC-V 'virt' libqos machine.
> The 'idx' test from vhost-user-blk-test.c errors out with a timeout in
> qvirtio_wait_used_elem(). The timeout happens because when processing
> the first element, 'avail_event' is read in qvirtqueue_kick() as non-zero
> because we didn't initialize it properly (and the memory at that point
> happened to be non-zero). 'idx' is 0.
> 
> All of this makes this condition fail because "idx - avail_event" will
> overflow and be non-zero:
> 
> /* < 1 because we add elements to avail queue one by one */
> if ((flags & VRING_USED_F_NO_NOTIFY) == 0 &&
>                          (!vq->event || (uint16_t)(idx-avail_event) < 1)) {
>      d->bus->virtqueue_kick(d, vq);
> }
> 
> As a result the virtqueue is never kicked and we'll timeout waiting for it.
> 
> Fixes: 1053587c3f ("libqos: Added EVENT_IDX support")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   tests/qtest/libqos/virtio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
> index 4f39124eba..82a6e122bf 100644
> --- a/tests/qtest/libqos/virtio.c
> +++ b/tests/qtest/libqos/virtio.c
> @@ -265,7 +265,7 @@ void qvring_init(QTestState *qts, const QGuestAllocator *alloc, QVirtQueue *vq,
>       /* vq->used->idx */
>       qvirtio_writew(vq->vdev, qts, vq->used + 2, 0);
>       /* vq->used->avail_event */
> -    qvirtio_writew(vq->vdev, qts, vq->used + 2 +
> +    qvirtio_writew(vq->vdev, qts, vq->used + 4 +
>                      sizeof(struct vring_used_elem) * vq->size, 0);
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


