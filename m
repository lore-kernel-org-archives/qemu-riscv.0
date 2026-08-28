Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A23C61DBD
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 10:20:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wztgX-0001C0-EU; Fri, 28 Aug 2026 06:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wztgW-00017v-Di
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 06:19:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wztgU-0002hL-Jl
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 06:19:44 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SA7EVo2725212
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pLeDyIe24xlxelqivhxFI+C08k7EOIn3h4F7ph1yYvc=; b=bWXYocUR7lIQ3ijM
 MkRbBFMz9EUllcmW4xu06IRmgdGKC5WPDsG74Yfsle7hshzSrGIbru6eG/c2bdOa
 k7GiR59KOF19ty/CgkFYqcjtViq7c80KU1mptISveF51cvHLmMyj37kmwu41TcdB
 0bcvMj11qfFQIWNt5vCUpxmsLC+vZ4ZrQKPxq5ZGy74RtJ9NN/0t7nmwVZSyooXn
 Xsnt+m3X69kkVPuxQtlxJ+tyVcVWaNZEZhZdsfIX/kItHCav395xbk9sH+yJ43Bu
 sHZgvy+EPERUNxJ9XrVgIuFQ3fdHHSxuovxrDAoe4kvrflA5BOB6W0fwi3uc40ja
 scE5yQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh08hn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 10:19:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c01ff996dso9608311cf.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787912380; x=1788517180; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pLeDyIe24xlxelqivhxFI+C08k7EOIn3h4F7ph1yYvc=;
 b=jmvs1HmOIiU5At/wfiLwWEG1sdQXzZYfXfAKT+stZzv0TsEl9DqMraC1LcUvOSYLKl
 Jy0e97E/fqgYidTskaLJGCHj7tjPWCpi41kWPWNTR3EnMUsL9TWZD4PSfnQ876F6D5Om
 2HTPyTBFaIN1Tu5VJ0o29SLPcCD8iG3PBnjuJzX/NCyg00TOqZMPZacpGjxzzD/O+V56
 m+vWnFNK2OkJaZ5IsPRM/km+rGT+tmfAzJEpvIFLVWMKVSu/ZGwBJc0Bcm/YIWXUVdOa
 lowHNxp0cTtl4Mr39CruG70eGJ1fi11PW9uQH8nZV4LgnBzjW8ANGAIYrllPEwYGATko
 EAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787912380; x=1788517180;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pLeDyIe24xlxelqivhxFI+C08k7EOIn3h4F7ph1yYvc=;
 b=lojsrBIwlNFoHIcktzOndtKsEGW4XQrOnXcVzIBay0MvDZ6ZDU+hRbeETc5+0STmst
 Ng/sCC+DpwitgO7plVbQtjyKVMTFshZPfdhR+AKgpUB6d6a9GhGqAstSG4ZPW6Njm/3/
 Clp7wn9KBUnrhLnqOkxUGUyzB9enCTS1W3iZqVoZkh2Kr4T/b1z+JgzK6iKir+9Kx1Di
 eWBmBNXVJxVt56IHLOe9ccFoPguhhHIhFW/KpNkNu+u0prDh0LT25sPNbO/WaXa+yjYU
 dV2d/KzGEDTdvYqQsUuIDkDyE4LRJViOPCv0Y3MQc9aFLKoSmIB9VJGSK6rOODXDvREO
 Rpgw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpFwHmedHcOwlpS6T0JiXVZihTbIkGAt91cIy+Bj/wPypUNPi3J5QUAa4r8PtBwQs/hWWq+BO3LHt9u@nongnu.org
X-Gm-Message-State: AFuF++nN7obangqYFr/6h86lGvZs1Bawf/+UDQ+cZ+g+kI9DopJ7R+qM
 abY0duunZeVr/Pls6TJCHE3i3Av6yJslrMneD9dnTKIUmV2CUkvqntxwz3VvPnp2EalLPmdWjKh
 IV2jcLRXTd7rqGl7dDs02hX9C6J5juFFCru0jLeiAXlOHLdSdAVGvWAy14Q==
X-Gm-Gg: AR+sD11D+tlmkCQwiGcCcT1EtV1RDFuWze19M0S+21m5m/COfqWF+IRjnE2dvVkCDEk
 1fAh5BIhUxz/+mvnwkNi/nnaoqedQ7gpqvpaGxQJDZOQna+g6yURyPsynbxA7zethryRlMoezIs
 ijKQvVQtVjdpZ+wqgt3JR9nmDA2rKDfFlB9y/ygP4v3CmBV5uffyzTdXYM5O2nyMHxbpsqD9APl
 Kh2XdtZFRMnQfFDKswA+31Hm7KF1ebKwvpt4iGIw3Z0Brhmn0Y+jWgohoLMdUHr9jJTtxcoO2mL
 rDGPjMgRO3UPZsDhokxJy6wdKI75SFSMWACcsKK4vXtMBQA0t1xAVP/CA4B1xZsonzDqxLCVdnx
 FJiEUkSCBIC3aACH6v20uaKNu7r+DqUBgwA==
X-Received: by 2002:ac8:5d13:0:b0:52e:2d4e:8eef with SMTP id
 d75a77b69052e-52fb93d6dcbmr61126321cf.4.1787912370523; 
 Fri, 28 Aug 2026 03:19:30 -0700 (PDT)
X-Received: by 2002:ac8:5d13:0:b0:52e:2d4e:8eef with SMTP id
 d75a77b69052e-52fb93d6dcbmr61125891cf.4.1787912369979; 
 Fri, 28 Aug 2026 03:19:29 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dc1076sm39706795e9.3.2026.08.28.03.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 03:19:29 -0700 (PDT)
Message-ID: <deabd371-a764-4556-8f2e-15f0e50649b2@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 36/49] monitor: tighten monitor_printf*()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: dave@treblig.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,
 zhenwei pi <zhenwei.pi@linux.dev>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowangio@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Hyman Huang <infra.ai.cloud@bitdeer.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
References: <20260825-qemu-no-hmp-v4-0-af60857c2fbe@redhat.com>
 <20260825-qemu-no-hmp-v4-36-af60857c2fbe@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260825-qemu-no-hmp-v4-36-af60857c2fbe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BEw1DiEYifylkas4MBtzKTPJkWbsgJdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX8F1HH4hOqjPw
 4z1LGKVH2zVTzBYp+TpV+WY6327+kB146zhZWgkhhPEmQIjMYahOegppfknM2smJTXL3nGqzvZO
 jNXwtXfTy4uonsBQkjg4rlXxfvIhsAuPVKkO6Rbd5AxULiD/yJGvvl1ZI98OkA/BCJswtYOfXap
 LorgKJYjckqV1w7x7z1VHiavt6/iByZJgtDZvfd2W1wtzoD4ZixkinuI4teCCk91300hjj4skni
 PhQxPQOz9mxQQ17qcesj+CsQZaVdcShF6CLcbafx3Cw55T+F6gK1xohTVYPGUTCBPvI53e8HA5O
 4S/2FIiBCdQ5rE7MsPMm3GoJ0iLS3QuLDUaaCZvsXeP2FNXyc7G/0zRTXd3VVr2Q32EXnqocnHC
 KQb9/x9mqJ8mr/bR6wY5g65zJKB8DAOH1ZkzRvoeuZFpdgCuDaNcZNKAPMjlirFkReXJ5e2592M
 VUGd7GyU0vVb04trplg==
X-Proofpoint-ORIG-GUID: BEw1DiEYifylkas4MBtzKTPJkWbsgJdL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX5eETTCcdHf1k
 rMa/LJ0QpbWnRukf3x/7z71bQn7nPpWec70qjFh+X8BmjSfDlFSYtup29KhyUEkmyZwpO/sZqcT
 2h3PcM0DU0CgGiztG4lTXgLQuh2sW2Y=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a9160bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=_7nI1AEwapyDFsg1MK8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 25/8/26 21:09, Marc-AndrÃ© Lureau wrote:
> Rename monitor_printf->monitor_hmp_printf, monitor_vprintf->
> monitor_hmp_vprintf, and monitor_printc->monitor_hmp_printc, changing
> the first parameter from Monitor * to MonitorHMP * to enforce type
> safety. The implementation is also simplified: monitor_hmp_vprintf now
> directly calls g_strdup_vprintf + monitor_puts, removing the virtual
> dispatch via moncls->vprintf.
> 
> The dev_print() callbacks are temporarily using the MONITOR_HMP(mon)
> cast, they are fixed in the following commits.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio-hmp-cmds.c                  |   6 +-
>   backends/cryptodev-hmp-cmds.c           |   9 +-
>   block/monitor/block-hmp-cmds.c          | 170 +++++++++---------
>   chardev/char-hmp-cmds.c                 |  12 +-
>   disas/disas-mon.c                       |  10 +-
>   docs/devel/style.rst                    |   2 +-
>   docs/devel/writing-monitor-commands.rst |   8 +-
>   dump/dump-hmp-cmds.c                    |   5 +-
>   hw/char/virtio-serial-bus.c             |  10 +-
>   hw/core/machine-hmp-cmds.c              | 213 +++++++++++-----------
>   hw/core/sysbus.c                        |   5 +-
>   hw/hexagon/hexagon_tlb.c                |  44 ++---
>   hw/i386/kvm/xen-stubs.c                 |   6 +-
>   hw/i386/kvm/xen_evtchn.c                |  21 +--
>   hw/i386/sgx-hmp-stub.c                  |   3 +-
>   hw/i386/sgx.c                           |  29 ++-
>   hw/misc/auxbus.c                        |   9 +-
>   hw/misc/mos6522-stub.c                  |   3 +-
>   hw/net/rocker/rocker-hmp-cmds.c         | 146 ++++++++--------
>   hw/pci/pci-hmp-cmds.c                   | 114 ++++++------
>   hw/pci/pci-stub.c                       |   3 +-
>   hw/s390x/s390-skeys.c                   |   9 +-
>   hw/s390x/s390-stattrib.c                |  20 +--
>   hw/uefi/ovmf-log.c                      |   5 +-
>   hw/usb/bus.c                            |  11 +-
>   hw/usb/host-libusb.c                    |  21 ++-
>   hw/virtio/virtio-hmp-cmds.c             | 297 ++++++++++++++++---------------
>   hw/xen/xen-bus.c                        |   5 +-
>   include/disas/disas.h                   |   4 +-
>   include/monitor/hmp.h                   |  12 +-
>   migration/dirtyrate.c                   |  46 +++--
>   migration/migration-hmp-cmds.c          | 301 ++++++++++++++++----------------
>   monitor/hmp-cmds.c                      | 141 +++++++--------
>   monitor/hmp.c                           | 143 +++++++--------
>   monitor/monitor-internal.h              |   6 -
>   monitor/monitor.c                       |  33 ++--
>   net/net-hmp-cmds.c                      |  31 ++--
>   net/slirp.c                             |  31 ++--
>   qom/qom-hmp-cmds.c                      |  27 ++-
>   replay/replay-debugging.c               |   5 +-
>   stats/stats-hmp-cmds.c                  |  57 +++---
>   stubs/hmp-cmd-info_sev.c                |   3 +-
>   stubs/monitor-core.c                    |   2 +-
>   system/dirtylimit-hmp-cmds.c            |  10 +-
>   system/qdev-monitor.c                   |  19 +-
>   system/runstate-hmp-cmds.c              |  16 +-
>   system/tpm-hmp-cmds.c                   |  29 ++-
>   target/i386/cpu-apic.c                  |   3 +-
>   target/i386/monitor.c                   | 152 ++++++++--------
>   target/i386/sev.c                       |  35 ++--
>   target/m68k/monitor.c                   |   3 +-
>   target/ppc/monitor.c                    |   3 +-
>   target/riscv/monitor.c                  |  55 +++---
>   target/sh4/monitor.c                    |  29 ++-
>   target/sparc/monitor.c                  |   3 +-
>   target/xtensa/monitor.c                 |   3 +-
>   tests/unit/test-util-sockets.c          |   2 +-
>   tools/qemu-vnc/clipboard.c              |   4 +-
>   tools/qemu-vnc/stubs.c                  |   2 +-
>   trace/trace-hmp-cmds.c                  |  12 +-
>   ui/ui-hmp-cmds.c                        | 115 ++++++------
>   util/error-report.c                     |   2 +-
>   util/qemu-print.c                       |  11 +-
>   63 files changed, 1219 insertions(+), 1327 deletions(-)

Painful.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

